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
import { getVideoPermissions } from "../helpers-video";

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
        }
    }
}
</script>