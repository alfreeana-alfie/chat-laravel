<template>
  <v-layout>
      <v-card>
        <!-- All Members **START** -->
        <v-card-text>
            <video autoplay ref="broadcaster"></video>
            <video autoplay ref="viewer"></video>

            <video autoplay ref="viewer02"></video>
        <div>
            <v-card>
                <div class="row" v-if="incomingVideoCallDialog">
                    <div class="col"> 
                        <p>Incoming Video Call from <strong>{{ videoCallerDetails.name }}</strong></p>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-danger">Decline</button>
                            <button type="button" class="btn btn-success ml-5" @click="acceptCall(videoCallerDetails.id)">Accept</button>
                        </div>
                    </div>
                </div>
            </v-card>
        </div>
        </v-card-text>

        <v-card-text>
                <v-list>
                    <v-list-item-group color="#1976D2">
                        <template v-for="(user, index) in allusers" >
                                <v-list-item :key="index"> 
                                    <v-list-item-avatar>
                                        <v-icon>
                                            mdi-account-circle
                                        </v-icon>
                                    </v-list-item-avatar>
                                    <v-list-item-content v-on:click="startCall(user.id, user.name)">
                                        <v-list-item-title v-html="user.name">{{ user.name }}</v-list-item-title>
                                        <v-list-item-subtitle>
                                            <span class="badge badge-light">{{ getUserOnlineStatus(user.id) }}</span>
                                            <span class="badge badge-light">{{ getUserOnlineStatusVideo(user.id) }}</span>
                                            <span class="badge badge-light">{{ getUserOnlineStatusVideoGroup(user.id) }}</span>
                                        </v-list-item-subtitle>
                                    </v-list-item-content>
                                </v-list-item>
                        </template>
                    </v-list-item-group>
                </v-list>
                                       
        <!-- All Members **END** -->
        </v-card-text>
        </v-card>
    </v-layout>
</template>

<script>
import Peer from "simple-peer";
import { getVideoPermissions } from "../helpers-video";
export default {
    data(){
        return { 
            streamingPresenceChannel: null,
            broadcasterPeer: null,
            broadcasterId: null,

            allusers: [],
            currentlyContactedUser: null,
            allPeers: {},
            streamLink: null,
            isVisibleLink: false,
            callingUserID: null,

            isVideoFocusMyself: true,
            videoCallPlaced: false,
            videoCallPartner: null,
            videoMutedAudio: false,
            videoMutedVideo: false,
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

            checkCallParams: {
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


            streamCallParams: {
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
        }
    },

    computed: {
        streamID() {
            return `${this.$userId}123`;
        },

        // Video Computed
        incomingVideoCallDialog() {
        if (
            this.videoCallParams.receivingCall &&
            this.videoCallParams.caller !== this.authUserID
        ) {
            return true;
        }
        return false;
        },

        videoCallerDetails() {
        if (
            this.videoCallParams.caller &&
            this.videoCallParams.caller !== this.authUserID
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

    created(){
        this.getAllUsers();
    },
    
    mounted() {
        this.initializeVideoChannel();
        this.initializeVideoCallListeners(); 

        this.initializeStatusChannel();
        this.initializeStatusListeners();

        this.initializeVideoGroupChannel();
        this.initializeVideoGroupListeners();
    },

    methods: {
        getAllUsers() {
            axios.post('group', 
            {
                user_id: this.$userId,
            })
            .then(response => {
                // console.log(response.data);
                axios.post('getGroupName', 
                {
                    groupID: response.data
                })
                .then(response => {
                    this.allusers = response.data
                    // console.log(response.data)
                })
            })
        },

        getUserID(groupID) {
            axios.post('get-ID', 
            {
                group_id: groupID,
            })
            .then(response => {
                console.log(response.data);
            })
        },

        getUserOnlineStatus(id) {
            const onlineUserIndex = this.checkCallParams.users.findIndex(
                (data) => data.id === id
            );
            
            if (onlineUserIndex < 0) {
                return "Offline";
            }else{
                return "Online";
            }
        },

        getUserOnlineStatusVideo(id) {
            const onlineUserIndex = this.videoCallParams.users.findIndex(
                (data) => data.id === id
            );
            if (onlineUserIndex < 0) {
                return "Offline";
            }else{
                return "Online";
            }
        },

        getUserOnlineStatusVideoGroup(id) {
            const onlineUserIndex = this.streamCallParams.users.findIndex(
                (data) => data.id === id
            );
            
            if (onlineUserIndex < 0) {
                return "Offline";
            }else{
                return "Online";
            }
        },

        getVideoMediaPermission() {
            return getVideoPermissions()
                .then((stream) => {
                this.streamCallParams.stream = stream;
                if (this.$refs.broadcaster) {
                    console.log('broadcaster');
                    this.$refs.broadcaster.srcObject = stream;
                }
                })
                .catch((error) => {
                console.log(error);
                });
        },

        initializeVideoChannel() {
            this.videoCallParams.channel = window.Echo.join(`Demo.${this.$userId}`);
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
                // console.log(data);
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

        initializeStatusChannel() {
            // window.Echo.channel('Demo' +  '2');
            this.checkCallParams.channel = window.Echo.join('checkOnline');
        },

        initializeStatusListeners() {
            this.checkCallParams.channel.here((users) => {
                this.checkCallParams.users = users;
            });

            this.checkCallParams.channel.joining((user) => {
                // check user availability
                const joiningUserIndex = this.checkCallParams.users.findIndex(
                    (data) => data.id === user.id
                );
                if (joiningUserIndex < 0) {
                    this.checkCallParams.users.push(user);
                }
            });
            this.checkCallParams.channel.leaving((user) => {
                const leavingUserIndex = this.checkCallParams.users.findIndex(
                    (data) => data.id === user.id
                );
                    this.checkCallParams.users.splice(leavingUserIndex, 1);
            });
        },

        // Streaming users
        initializeVideoGroupChannel() {
            this.streamCallParams.channel = window.Echo.join(`streaming-channel.${this.streamID}`);
        },

        initializeVideoGroupListeners() {
            this.streamCallParams.channel.here((users) => {
                this.streamCallParams.users = users;
            });

            this.streamCallParams.channel.joining((user) => {
                // check user availability
                const joiningUserIndex = this.streamCallParams.users.findIndex(
                (data) => data.id === user.id
                );
                if (joiningUserIndex < 0) {
                this.streamCallParams.users.push(user);
                // A new user just joined the channel so signal that user
                this.currentlyContactedUser = user.id;
                this.$set(
                    this.allPeers,
                    `${user.id}`,
                    this.peerCreator(
                    this.$refs.broadcaster.srcObject,
                    user,
                    this.signalCallback
                    )
                );
                // Create Peer
                this.allPeers[user.id].create();
                // Initialize Events
                this.allPeers[user.id].initEvents();
                }
            });
            this.streamCallParams.channel.leaving((user) => {
                const leavingUserIndex = this.streamCallParams.users.findIndex(
                    (data) => data.id === user.id
                );
                    this.streamCallParams.users.splice(leavingUserIndex, 1);
            });

            
        },

        initializeSignalAnswerChannel() {
            window.Echo.private(`stream-signal-channel.${this.$userId}`).listen(
                "StreamAnswer",
                ({ data }) => {
                console.log("Signal Answer from private channel");
                if (data.answer.renegotiate) {
                    console.log("renegotating");
                }
                if (data.answer.sdp) {
                    const updatedSignal = {
                    ...data.answer,
                    sdp: `${data.answer.sdp}\n`,
                    };
                    this.allPeers[this.currentlyContactedUser]
                    .getPeer()
                    .signal(updatedSignal);
                }
                }
            );
        },

        peerCreator(stream, user, signalCallback) {
            console.log(user.id);
            let peer;
                return {
                    create: () => {
                    peer = new Peer({
                        initiator: true,
                        trickle: false,
                        stream: stream
                    });
                    },
                    getPeer: () => peer,
                    initEvents: () => {
                    peer.on("signal", (data) => {
                        // send offer over here.
                        signalCallback(data, user);
                        this.acceptCall(user.id);
                    });
                    peer.on("stream", (stream) => {
                        console.log("onStream");
                    });
                    peer.on("track", (track, stream) => {
                        console.log("onTrack");
                    });
                    peer.on("connect", () => {
                        console.log("Broadcaster Peer connected");
                    });
                    peer.on("close", () => {
                        console.log("Broadcaster Peer closed");
                    });
                    peer.on("error", (err) => {
                        console.log("handle error gracefully");
                    });
                    },
                };
        },

        signalCallback(offer, user) {
            axios
                .post("/stream-offer", {
                    broadcaster: this.$userId,
                    receiver: user,
                    offer,
                })
                .then((res) => {
                    console.log(res);
                })
                .catch((err) => {
                    console.log(err);
                });
        },

        async startCall(id, name) {
            this.callingUserID = this.$userId;
            
            this.videoCallPlaced = true;
            this.videoCallPartner = name;

            this.videoCallParams.peer1 = new Peer({
                initiator: true,
                trickle: false,
            });

            axios.post('get-ID', 
            {
                group_id: id,
                user_id: this.$userId
            })
            .then(response => {
                console.log(response.data);
                var user_id = response.data;

                user_id.forEach(n => {
                    this.videoCallParams.peer1.on("signal", (data) => {
                        axios.post("/video/call-user", {
                            user_to_call: n,
                            signal_data: data,
                            from: this.authUserID,
                        }).then((response) => {
                            console.log(response);
                        }).catch((error) => {
                            console.log(error);
                        });
                    });
                });
            })

            
            
            await this.getVideoMediaPermission();
            
            this.initializeSignalAnswerChannel();

            this.videoCallParams.peer1.on("close", () => {
                console.log("Call Closed Caller");
            });
        },

        async acceptCall(id){
            console.log("SHARE LINK: "+ id);
            this.streamLink = `http://127.0.0.1:8000/streaming/${id}123`;

            this.streamingPresenceChannel = window.Echo.join(
                `streaming-channel.${id}123`
            );
            this.initializeSignalOfferChannel();
        },

        initializeStreamingChannel() {
            this.streamCallParams.channel = window.Echo.join(
                `streaming-channel.${id}123`
            );
        },
        initializeSignalOfferChannel() {
            window.Echo.private(`stream-signal-channel.${this.$userId}`).listen(
                "StreamOffer",
                ({ data }) => {
                console.log("Signal Offer from private channel");
                console.log(data.broadcaster);
                this.broadcasterId = data.broadcaster;
                this.createViewerPeer(data.offer, data.broadcaster);
                }
            );
        },
        createViewerPeer(incomingOffer, broadcaster) {
            const peer = new Peer({
                initiator: false,
                trickle: false,
            });

            this.handlePeerEvents(
                peer,
                incomingOffer,
                broadcaster,
                this.removeBroadcastVideo
            );
            this.broadcasterPeer = peer;
            },
            handlePeerEvents(peer, incomingOffer, broadcaster, cleanupCallback) {
            peer.on("signal", (data) => {
                axios
                .post("/stream-answer", {
                    broadcaster,
                    answer: data,
                })
                .then((res) => {
                    console.log(res);
                })
                .catch((err) => {
                    console.log(err);
                });
            });
            peer.on("stream", (stream) => {
                // display remote stream
                this.$refs.viewer.srcObject = stream;
            });
            peer.on("track", (track, stream) => {
                console.log("onTrack");
            });
            peer.on("connect", () => {
                console.log("Viewer Peer connected");
            });
            peer.on("close", () => {
                console.log("Viewer Peer closed");
                peer.destroy();
                cleanupCallback();
            });
            peer.on("error", (err) => {
                console.log("handle error gracefully");
            });
            const updatedOffer = {
                ...incomingOffer,
                sdp: `${incomingOffer.sdp}\n`,
            };
            peer.signal(updatedOffer);
        },
        removeBroadcastVideo() {
            console.log("removingBroadcast Video");
            alert("Livestream ended by broadcaster");
            const tracks = this.$refs.viewer.srcObject.getTracks();
            tracks.forEach((track) => {
                track.stop();
            });
            this.$refs.viewer.srcObject = null;
        },
    }
}
</script>