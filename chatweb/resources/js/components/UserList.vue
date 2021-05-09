<template>
    <v-layout>
        <!-- Chat Messages **Start** -->
        <div id='chat' v-if="componentKey">
            <v-card width="420" height="550">
                    <v-toolbar dark>
                        <v-btn icon @click="closeChat"> 
                            <v-icon>mdi-close</v-icon>
                        </v-btn>
                        <v-toolbar-title> {{ userName }}</v-toolbar-title>
                        <v-spacer></v-spacer>
                        <v-btn icon>
                            <v-icon>mdi-phone</v-icon>
                        </v-btn>
                        <v-btn icon @click="placeVideoCall(toUserId, userName)">
                            <v-icon>mdi-video</v-icon>
                        </v-btn>
                        <v-btn icon>
                            <v-icon>mdi-dots-vertical</v-icon>
                        </v-btn>
                    </v-toolbar>
                    <div id="chatCard">
                        <v-card flat height="550">
                            <v-card-text class="flex-grow-1 overflow-y-auto">
                                <template v-for="(message, index) in messages" >
                                    <div :class="message.user_id != currentID ? 'd-flex flex-row' : 'd-flex flex-row-reverse'" :key="index">
                                        <v-menu offset-y>
                                            <template v-slot:activator="{ on }">
                                                <v-hover>
                                                    <v-chip
                                                        :color="message.user_id != currentID ? '' : '#1565C0'"
                                                        dark
                                                        style="height:35px; white-space: normal;"
                                                        class="pa-4 mb-2"
                                                        v-on="on">
                                                        {{ message.body }}
                                                    </v-chip>
                                                </v-hover>
                                            </template>
                                        </v-menu>
                                    </div>
                                </template>
                            </v-card-text>
                            <v-text-field 
                                    ma-0 pa-0
                                    v-model="newMessage"
                                    placeholder="Type a message..." 
                                    type="text"
                                    regular
                                    single-line
                                    clearable
                                    filled
                                    append-icon="mdi-send"
                                    @click:append="sendMessage"
                                    @keyup.enter="sendMessage"
                                    name="message"
                                    > 
                                </v-text-field>
                        </v-card>
                    </div>
                </v-card>
        </div>

        <!-- Video Call **START**  -->
        <div id="video" v-if="callPlaced">
            <v-card width="420" height="550">
                <v-toolbar dark flat>
                    <v-btn icon @click="closeChat"> 
                        <v-icon>mdi-close</v-icon>
                    </v-btn>
                    <v-toolbar-title>{{callPartner}}</v-toolbar-title>
                </v-toolbar>
                <div class="row mt-5" id="video-row">
                    <div class="col-12 video-container" >
                            <video
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
                            <v-card-text v-else>
                                <div class="partner-video" >
                                    <div v-if="callPartner" class="column items-center q-pt-xl">
                                    <div class="col q-gutter-y-md text-center">
                                        <p class="q-pt-md">
                                        <strong>{{ callPartner }}</strong>
                                        </p>
                                        <p>calling...</p>
                                    </div>
                                    </div>
                                </div>
                            </v-card-text>
                            <div class="action-btns">
                                <v-btn class="btn btn-info" color="#1565C0" @click="toggleMuteAudio">
                                    <v-icon>{{ mutedAudio ? "mdi-microphone" : "mdi-microphone-off" }}</v-icon>
                                </v-btn>
                                <v-btn class="btn btn-primary mx-4" color="#1565C0" @click="toggleMuteVideo">
                                    <v-icon>{{ mutedVideo ? "mdi-video" : "mdi-video-off" }}</v-icon>
                                </v-btn>
                                <v-btn class="btn btn-danger" color="#C62828" @click="endCall">
                                    <v-icon>mdi-phone-hangup</v-icon>
                                </v-btn>
                            </div>
                        
                    </div>
                </div>
            </v-card>
        </div>
        <!-- Video Call **END**  -->

        <div id="incomingVideoReq">
            <v-card>
                <div class="row" v-if="incomingCallDialog">
                    <div class="col"> 
                        <p>Incoming Call from <strong>{{ callerDetails.name }}</strong></p>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-danger" data-dismiss="modal" @click="declineCall">Decline</button>
                            <button type="button" class="btn btn-success ml-5" @click="acceptCall(callerDetails.name)">Accept</button>
                        </div>
                    </div>
                </div>
            </v-card>
        </div>

        <!-- Chat Messages **End** -->

        <!-- All Members **Start** -->
        <v-card width="420" height="550" class="pa-0">
            <v-card-text class="pa-0">
                <v-row no-gutters align="center">
                    <v-col cols="6" md="4">
                        <v-card-text>
                            <v-icon>mdi-account-circle</v-icon> {{ authUserName }} </v-card-text>
                    </v-col>
                    <v-col cols="12" md="8">
                        <v-chip-group column>
                            <v-chip class="ma-1" small> All Members </v-chip>
                            <v-chip class="ma-1" small> Friend List </v-chip>
                            <v-chip class="ma-1" small> Group List </v-chip>
                            <v-chip class="ma-1" small> Friend Request </v-chip>
                            <v-chip class="ma-1" small> Merchant </v-chip>
                        </v-chip-group>
                    </v-col>
                </v-row>
            </v-card-text>

            <v-list>
                <v-list-item-group color="#1976D2" v-model="model">
                    <template v-for="(user, index) in allusers" >
                            <v-list-item :key="index"> 
                                <v-list-item-avatar>
                                    <v-icon>
                                        mdi-account-circle
                                    </v-icon>
                                </v-list-item-avatar>
                                <v-list-item-content v-on:click="getUserMessage(user.id, user.name, componentKey++)">
                                    <v-list-item-title v-html="user.name">{{ user.name }}</v-list-item-title>
                                    <v-list-item-subtitle>
                                        <span class="badge badge-light">{{ getUserOnlineStatus(user.id) }}</span>
                                    </v-list-item-subtitle>
                                </v-list-item-content>
                                    <v-list-item-action>
                                        <v-btn icon v-on:click="sentFriendRequest(user.id)"><v-icon>mdi-account-plus</v-icon></v-btn>
                                    </v-list-item-action>
                            </v-list-item>
                            <v-divider v-if="user.divider" :key="user.name"></v-divider>
                    </template>
                </v-list-item-group>
            </v-list>

        </v-card>
        <!-- All Members **End** -->

        
    </v-layout>
</template>


<script>
import Chat from "./Chat";
import Peer from "simple-peer";
import { getPermissionsVideo } from "../helpers-video";

export default {
    components: {
        Chat
    },

    props: [
        'authUserName',
        "authUserID"
    ],

    data(){
        return{
            // Message data
            messages: [],
            newMessage: '',

            // User data
            currentID: this.$userId,
            chatID: '',
            userName: '', 
            toUserId: '',
            allusers: [],
            isOpenChat: false,
            componentKey: 0, 
            model: 1,

            // Video Call data
            isFocusMyself: true,
            callPlaced: false,
            callPartner: null,
            mutedAudio: false,
            mutedVideo: false,
            videoCallParams: {
                users: [],
                stream: null,
                receivingCall: false,
                caller: null,
                callerSignal: null,
                callAccepted: false,
                channel: null,
                peer1: null,
                peer2: null,
            },

            dialog: false,
        }
    },

    mounted(){
        this.getUserList();

        this.initializeVideoChannel();
        this.initializeVideoCallListeners(); 
    },

    computed: {
        incomingCallDialog() {
        if (
            this.videoCallParams.receivingCall &&
            this.videoCallParams.caller !== this.authuserid
        ) {
            return true;
        }
        return false;
        },
        callerDetails() {
        if (
            this.videoCallParams.caller &&
            this.videoCallParams.caller !== this.authuserid
        ) {
            const incomingCaller = this.allusers.filter(
            (user) => user.id === this.videoCallParams.caller
            );
            return {
            id: this.videoCallParams.caller,
            name: `${incomingCaller[0].name}`,
            };
        }
        return null;
        },
    },

    methods: {
        getUserList(){
            axios.get('user-member').then(response => {
                this.allusers = response.data;
            })
        },

        // Get Chat Room ID for messages
        getUserMessage(user_id, name, isOpenChat){
            this.userName = name,
            this.toUserId = user_id

            axios.post('http://127.0.0.1:8000/api/chatID', 
            {
                user_id: this.$userId, 
                to_user_id: user_id
            })
            .then(response => {
                this.chatID = response.data.id;
                this.fetchMessages();

                this.componentKey += 1;
                this.openChat();
            })
            .catch(error => {
                console.log(error);
            })
        },

        openChat(){
            document.getElementById("chat").style.display = "block";
        },

        closeChat(){
            document.getElementById("chat").style.display = "none";
        },
        
        fetchMessages(){
            axios.post('http://127.0.0.1:8000/api/chats', 
            {
                chat_id: this.chatID
            })
            .then(response => {
                this.messages = response.data
                console.log(response.data)
            })
            .catch(error => {
                console.log(error);
            })
        },

        sendMessage(){
            this.messages.push({
                body: this.newMessage
            });

            axios.post('send', 
            {
                body: this.newMessage, 
                chat_id: this.chatID,
                user_id: this.$userId
            })
            .then(response => {
                this.allusers = response.data
            })
            .catch((error) => {
                console.log(error);
            })

            this.newMessage = ''
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

        
        /* Video Call --START-- */
        initializeVideoChannel() {
            this.videoCallParams.channel = window.Echo.join("Demo");
        },

        getMediaPermission() {
        return getPermissionsVideo()
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

        initializeVideoCallListeners() {
            this.videoCallParams.channel.here((users) => {
                this.videoCallParams.users = users;
            });

            this.videoCallParams.channel.joining((user) => {
                // check user availability
                const joiningUserIndex = this.videoCallParams.users.findIndex(
                    (data) => data.id === user.id
                );
                if (joiningUserIndex < 0) {
                    this.videoCallParams.users.push(user);
                }
            });
            this.videoCallParams.channel.leaving((user) => {
                const leavingUserIndex = this.videoCallParams.users.findIndex(
                    (data) => data.id === user.id
                );
                    this.videoCallParams.users.splice(leavingUserIndex, 1);
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
        },

        async placeVideoCall(id, name){ 
            this.dialog = true;
            this.callPlaced = true;
            this.callPartner = name;
            console.log(name);

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
            document.getElementById("chat").style.display = "none";
        },

        async acceptCall(name) {
            
            this.callPlaced = true;
            this.videoCallParams.callAccepted = true;
            this.callPartner = name;
            console.log(name);

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
            document.getElementById("chat").style.display = "none";
        },

        declineCall(){
            this.videoCallParams.receivingCall = false;
            document.getElementById("chatCard").style.display = "block";
        },

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
                "presence-Demo"
            ].disconnect();

            setTimeout(() => {
                this.callPlaced = false;
            }, 3000);
            
            
        },

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
            document.getElementById("video").style.display = "none";
            document.getElementById("chat").style.display = "block";
        },
        /* Video Call --END-- */
    }
}
</script>

<style>
#video-row {
  width: 410px;
  height: 500px;
  margin: 0;
}

#incoming-call-card {
  border: 1px solid #0acf83;
}

.video-container {
  width: 410px;
  height: 500px;
  max-width: 90vw;
  max-height: 50vh;
  margin: 0;
  position: relative;
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

