<template>
 <div id='chat'>
   <v-card width="420" height="550">
        <v-toolbar dark>
            <v-toolbar-title> {{ userName }}</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-btn icon>
                <v-icon>mdi-phone</v-icon>
            </v-btn>
            <v-btn icon>
                <v-icon>mdi-video</v-icon>
            </v-btn>
            <v-btn icon>
                <v-icon>mdi-dots-vertical</v-icon>
            </v-btn>
        </v-toolbar>
        <v-card class="scroll" flat  height="550">
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
        </v-card>
        <v-text-field 
            v-model="newMessage"
            placeholder="Type a message..." 
            type="text"
            solo
            clearable
            append-outer-icon="mdi-send"
            @click:append-outer="sendMessage"
            @keyup.enter="sendMessage"
            name="message"
            > 
        </v-text-field>
   </v-card>
 </div>
</template>

<style>
.v-card {
  display: flex !important;
  flex-direction: column;
}
.scroll {
   overflow-y: scroll
}
</style>
 
<script>
import Peer from "simple-peer";
import { getPermissions } from "../helpers";

export default {

    props: ['chatID', 'currentID', 'userName', 'toUserId'],
    
    data(){
        return{
            messages: [],
            newMessage: '',
            chat_id: this.chatID,
            to_user_id: this.toUserId,
            allusers: [],

            // Video Call data
            isFocusMyself: true,
            callPlaced: false,
            callPartner: null,
            mutedAudio: false,
            mutedVideo: false,

            videoCallParams: {
                users: [],
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

    created(){
        this.fetchMessages();
        this.getUserSingle();

        this.initializeChannel();
        this.initializeCallListeners(); 

        // console.log(this.to_user_id)

        Echo.join('chat')
            .listen('MessageSent',(event) => {
                this.messages.push(event.message);
            })
    },

    methods: {
        fetchMessages(){
            // console.log(this.chat_id)
            axios.post('http://127.0.0.1:8000/api/chats', 
            {
                chat_id: this.chat_id
            })
            .then(response => {
                this.messages = response.data
                // console.log(response.data)
            })
        },

        sendMessage(){
            this.messages.push({
                body: this.newMessage
            });

            axios.post('send', 
            {
                body: this.newMessage, 
                chat_id: this.chat_id,
                user_id: this.$userId
            })
            .then(response => {
                this.allusers = response.data
                // console.log(response.data)
            })

            this.newMessage = ''
        },

        getUserOnlineStatus(id) {
            const onlineUserIndex = this.videoCallParams.users.findIndex(
                (data) => data.id === id
            );
            // console.log(onlineUserIndex);
            if (onlineUserIndex < 0) {
                console.log("Offline")
                return "Offline";
            }else{
                console.log("Online")
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

        getUserSingle(){
            this.getUserOnlineStatus(this.toUserId);

            axios.post('user-single', 
            {
                id: this.toUserId
            })
            .then(response => {
                this.allusers = response.data;
                // console.log(response.data)
            })
        },

        // Start Initialize Channel & Call
        initializeChannel() {
            this.videoCallParams.channel = window.Echo.join("Demo");
            // console.log(this.videoCallParams.channel);
        },

        initializeCallListeners() {
            this.videoCallParams.channel.here((users) => {
                this.videoCallParams.users = users;
            });

            this.videoCallParams.channel.joining((users) => {
                const joiningUserIndex = this.videoCallParams.users.findIndex((data) => data.id == user.id);
                if(joiningUserIndex < 0){
                    this.videoCallParams.users.push(user);
                }
            });

            this.videoCallParams.channel.leaving((users) => {
                const leavingUserIndex = this.videoCallParams.users.findIndex((data) => data.id == user.id);
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

            // console.log(this.videoCallParams.users);
        },
        // End Initialize Channel & Call

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
    }
}
</script>