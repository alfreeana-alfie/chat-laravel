<template>
<div id="video-chat">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="btn-group" role="group">
            <button
              type="button"
              class="btn btn-primary mr-2"
              v-for="(user, index) in allusers"
              :key="index"
              @click="placeVideoCall(user.id, user.name)"
            >
              Call {{ user.name }}
              <span class="badge badge-light">{{
                getUserOnlineStatus(user.id)
              }}</span>
              <span class="badge badge-light" id="userStatus"></span>
            </button>
          </div>
        </div>
      </div>
    <!--Placing Video Call-->
      <div class="row mt-5" id="video-row">
        <div class="col-12 video-container" v-if="callPlaced">
          <video
            id="video"
            ref="userVideo"
            muted
            playsinline
            autoplay
            class="cursor-pointer"
            :class="isFocusMyself === true ? 'user-video' : 'partner-video'"
            @click="toggleCameraArea"
          />
          <video
            ref="partnerVideo"
            playsinline
            autoplay
            class="cursor-pointer"
            :class="isFocusMyself === true ? 'partner-video' : 'user-video'"
            @click="toggleCameraArea"
            v-if="videoCallParams.callAccepted"
          />
          <div class="partner-video">
            <div class="column items-center q-pt-xl">
              <div class="col q-gutter-y-md text-center">
                <p class="q-pt-md">
                    <strong>{{ callPartner }}</strong>
                </p>
                <p>calling...</p>
              </div>
            </div>
          </div>
          <div class="action-btns">
            <button type="button" class="btn btn-info" @click="toggleMuteAudio">
                {{ mutedAudio ? "Unmute" : "Mute" }}
            </button>
            <button type="button" class="btn btn-primary mx-4" @click="toggleMuteVideo">
                {{ mutedVideo ? "ShowVideo" : "HideVideo" }}
            </button>
            <button type="button" class="btn btn-danger" @click="endCall">
                EndCall
            </button>
          </div>
        </div>
      </div>
      <!-- End of Placing Video Call  -->

      <!-- Incoming Call  -->
      <div class="row" v-if="incomingCallDialog">
          <div class="col"> 
              <p>Incoming Call from <strong>{{ callerDetails.name }}</strong></p>
              <div class="btn-group" role="group">
                  <button type="button" class="btn btn-danger" data-dismiss="modal" @click="declineCall">Decline</button>
                  <button type="button" class="btn btn-success ml-5" @click="acceptCall">Accept</button>
              </div>
          </div>
      </div>
      <!-- End of Incoming Call  -->
    </div>
</div>
</template>

<script>
import Peer from "simple-peer";
import { getPermissions } from "../helpers";

export default {
    props: [
        "allusers",
        "authUserID"
    ],
    data(){
        return{
            currentID: this.authUserID, // Current Logged in user
            isFocusMyself: true,
            callPlaced: false,
            callPartner: null,
            mutedAudio: false,
            mutedVideo: false,
            videoCallParams: {
                users: [], // User List Array
                channel: null,
                stream: null,
                receivingCall: false,
                caller: null,
                callerSignal: null,
                callerAccepted: false,
                peer1: null,
                peer2: null
            }
        }
    },

    mounted() {
        this.getUserList();
        // this.checkOnline(2);
        console.log(this.authUserID)
        // Channel Setups
        this.initializeChannel();
        this.initializeCallListeners(); 
    },

    computed: {
        incomingCallDialog() {
            if(this.videoCallParams.receivingCall && this.videoCallParams.caller != this.authUserID){
                return true;
            }else{
                return false;
            }
        },

        callerDetails() {
            if(this.videoCallParams.caller && this.videoCallParams.caller != this.authUserID){
                const incomingCaller = this.allusers.filter(
                    (user) => user.id == this.videoCallParams.caller
                );

                return {
                    id: this.videoCallParams.caller,
                    name: `${incomingCaller[0].name}`,
                };
            }
            return null;
        }
    },

    methods: {
        // Get User List 
        getUserList(){
            axios.get('user-member').then(response => {
                this.videoCallParams.users = response.data;
            })
        },

        getUserOnlineStatus(id) {
            const onlineUserIndex = this.videoCallParams.users.findIndex(
                (data) => data.id === id
            );
            if (onlineUserIndex < 0) {
                return "Offline";
            }else{
                return "Online";
            }
        },

        // Get Media permissions
        getMediaPermission() {
        return getPermissions()
            .then((stream) => {
            this.videoCallParams.stream = stream;
            if (this.$refs.userVideo) {
                this.$refs.userVideo.srcObject = stream;
            }
            })
            .catch((error) => {
            console.log(error);
            });
        },


        // Start Initialize Channel & Call
        initializeChannel() {
            this.videoCallParams.channel = window.Echo.join("Demo");
            // console.log(this.videoCallParams.channel);
        },

        initializeCallListeners() {
            this.videoCallParams.channel.here((users) => {
                this.videoCallParams.users = users;
                console.log(users)
            });

            this.videoCallParams.channel.joining((users) => {
                const joiningUserIndex = this.videoCallParams.users.findIndex((data) => data.id == user.id);
                if(joiningUserIndex < 0){
                    this.videoCallParams.users.push(user);
                    console.log(users)
                }
            });

            this.videoCallParams.channel.leaving((users) => {
                const leavingUserIndex = this.videoCallParams.users.findIndex((data) => data.id == user.id);
                this.videoCallParams.users.splice(leavingUserIndex, 1);
                console.log(users)
            });

            // listen to incomming call
            this.videoCallParams.channel.listen("StartVideoChat", ({ data }) => {
                console.log(data);
                if (data.type === "incomingCall") {
                // add a new line to the sdp to take care of error
                const updatedSignal = {
                    ...data.signalData,
                    sdp: `${data.signalData.sdp}\n`,
                };
                this.videoCallParams.receivingCall = true;
                this.videoCallParams.caller = data.from;
                this.videoCallParams.callerSignal = updatedSignal;
                }
            });

            // console.log(this.videoCallParams.channel);
        },
        // End Initialize Channel & Call

        destroyed() {
            Echo.leave(user => {
                this.users = this.users.filter(u => (u.id !== user.id));
            });
        },

        // Start Placing Video Call
        async placeVideoCall(id, name){
            this.callPlaced = true;
            this.callPartner = name;

            await this.getMediaPermission();
            this.videoCallParams.peer1 = new Peer({
                initiator: true,
                trickle: false,
                stream: this.videoCallParams.stream,
            });

            this.videoCallParams.peer1.on("signal", (data) => {
                axios.post("/video/call-user", {
                    user_to_call: id,
                    signal_data: data,
                    from: this.authUserID,
                }).then((response) => {
                    console.log(response);
                }).catch((error) => {
                    console.log(error);
                });
            });

            this.videoCallParams.peer1.on("stream", (stream) => {
                console.log("Call Streaming...");
                if (this.$refs.partnerVideo){
                    this.$refs.partnerVideo.srcObject = stream;
                }
            });

            this.videoCallParams.peer1.on("connect", () => {
                console.log("Peer Connected!")
            });

            this.videoCallParams.peer1.on("error", (error) => {
                console.log(error);
            });

            this.videoCallParams.peer1.on("close", () => {
                console.log("Call Closed Caller");
            });

            this.videoCallParams.channel.listen("StartVideoChat", ({data}) => {
                if(data.type == "callAccepted"){
                    if (data.signal.renegotiate) {
                        console.log("renegotating");
                    }
                    if(data.signal.sdp){
                        this.videoCallParams.callAccepted = true;
                        const updateSignal = {
                            ...data.signal,
                            sdp: `${data.signal.sdp}\n`,
                        };
                        this.videoCallParams.peer1.signal(updateSignal);
                    }
                }
            });
        },
        // End Placing Video Call

        // Start Accepting Video Call
        async acceptCall() {
            this.callPlaced = true;
            this.videoCallParams.callAccepted = true;
            await this.getMediaPermission();

            this.videoCallParams.peer2 = new Peer({
                initiator: false,
                trickle: false,
                stream: this.videoCallParams.stream,
            });

            this.videoCallParams.receivingCall = false;
            this.videoCallParams.peer2.on("signal", (data) => {
                axios.post("/video/accept-call", {
                    signal: data,
                    to: this.videoCallParams.caller,
                }).then((response) => {
                    console.log(response);
                })
                .catch((error) => {
                    console.log(error);
                });
            });

            this.videoCallParams.peer2.on("stream", (stream) => {
                this.videoCallParams.callAccepted = true;
                this.$refs.partnerVideo.srcObject = stream;
            });

            this.videoCallParams.peer2.on("connect", () => {
                console.log("Peer02 Connected");
                this.videoCallParams.callAccepted = true;
            });

            this.videoCallParams.peer2.on("error", (err) => {
                console.log(err);
            });

            this.videoCallParams.peer2.on("close", () => {
                console.log("Call Closed Accepter");
            });

            this.videoCallParams.peer2.signal(this.videoCallParams.callerSignal);
        },
        // End Accepting Video Call

        // Start Declining Video Call
        declineCall(){
            this.videoCallParams.receivingCall = false;
        },
        // End Declining Video Call

        // Start Ending Video Call
        endCall(){
            if(!this.mutedVideo) this.toggleMuteVideo();
            if(!this.mutedAudio) this.toggleMuteAudio();

            this.stopStreamedVideo(this.$refs.userVideo);
            if (this.authuserid === this.videoCallParams.caller) {
                this.videoCallParams.peer1.destroy();
            } else {
                this.videoCallParams.peer2.destroy();
            }
            this.videoCallParams.channel.pusher.channels.channels[
                "presence-presence-video-channel"
            ].disconnect();

            setTimeout(() => {
                this.callPlaced = false;
            }, 3000);
        },
        // End Ending Video Call

        toggleCameraArea() {
            if (this.videoCallParams.callAccepted) {
                this.isFocusMyself = !this.isFocusMyself;
            }
        },

        toggleMuteAudio(){
            if(this.mutedAudio){
                this.$refs.userVideo.srcObject.getAudioTracks()[0].enabled = true;
                this.mutedAudio = false;
            }else{
                this.$refs.userVideo.srcObject.getAudioTracks()[0].enabled = false;
                this.mutedAudio = true;
            }
        },

        toggleMuteVideo(){
            if (this.mutedVideo) {
                this.$refs.userVideo.srcObject.getVideoTracks()[0].enabled = true;
                this.mutedVideo = false;
            } else {
                this.$refs.userVideo.srcObject.getVideoTracks()[0].enabled = false;
                this.mutedVideo = true;
            }
        },

        stopStreamedVideo(videoElem) {
            const stream = videoElem.srcObject;
            const tracks = stream.getTracks();
            tracks.forEach((track) => {
                track.stop();
            });
            videoElem.srcObject = null;
        },
    }
}
</script>

<style scoped>
#video-row {
  width: 700px;
  max-width: 90vw;
}

#incoming-call-card {
  border: 1px solid #0acf83;
}

.video-container {
  width: 700px;
  height: 500px;
  max-width: 90vw;
  max-height: 50vh;
  margin: 0 auto;
  border: 1px solid #0acf83;
  position: relative;
  box-shadow: 1px 1px 11px #9e9e9e;
  background-color: #fff;
}

.video-container .user-video {
  width: 30%;
  position: absolute;
  left: 10px;
  bottom: 10px;
  border: 1px solid #fff;
  border-radius: 6px;
  z-index: 2;
}

.video-container .partner-video {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  top: 0;
  z-index: 1;
  margin: 0;
  padding: 0;
}

.video-container .action-btns {
  position: absolute;
  bottom: 20px;
  left: 50%;
  margin-left: -50px;
  z-index: 3;
  display: flex;
  flex-direction: row;
}

/* Mobiel Styles */
@media only screen and (max-width: 768px) {
  .video-container {
    height: 50vh;
  }
}
</style>