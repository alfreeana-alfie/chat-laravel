<template>
    <v-layout>
        <!-- Start Chat Component -->
        <component 
        :key="componentKey" 
        :is="myComponent" 
        :chatID="chatID" 
        :currentID="currentID" 
        :userName="userName" 
        :toUserId="toUserId"></component>
        <!-- End Chat Component -->

        <!-- Start User List -->
        <v-card width="420" height="550" class="pa-0">

            <!-- Card Text -->
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

            <!-- List -->
            <v-list>
                <v-list-item-group color="#1976D2" >
                    <template v-for="(user, index) in allusers" >
                            <v-list-item :key="index" >
                                <v-list-item-avatar>
                                    <v-icon>
                                        mdi-account-circle
                                    </v-icon>
                                </v-list-item-avatar>
                                <v-list-item-content v-on:click="getUserMessage(user.id, user.name, componentKey = !componentKey)">
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
        <!-- End User List -->
    </v-layout>
</template>


<script>
import Chat from "./Chat";
import Peer from "simple-peer";
import { getPermissions } from "../helpers";

export default {
    components: {
        Chat
    },

    props: [
        'authUserName',
        "allusers",
        "authUserID"
    ],

    data(){
        return{
            currentID: this.$userId,
            toUserId: '',
            chatID: '',
            userName: '', 
            componentKey: 0, // Component Key for changing values component
            myComponent: null,

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

    mounted(){

        this.initializeChannel();
        this.initializeCallListeners(); 
    },

    methods: {

        // Get Chat Room ID for messages
        getUserMessage(user_id, name, isValid){
            this.userName = name,
            this.toUserId = user_id

            axios.post('http://127.0.0.1:8000/api/chatID', 
            {
                user_id: this.$userId, 
                to_user_id: user_id
            })
            .then(response => {
                this.chatID = response.data.id;
                // console.log(this.chatID);
                
                this.myComponent = 'chat';
                this.componentKey += 1;
            })
        },

        // Start Video Call Settings
        getUserOnlineStatus(id) {
            const onlineUserIndex = this.videoCallParams.users.findIndex(
                (data) => data.id === id
            );
            // console.log(onlineUserIndex);
            if (onlineUserIndex < 0) {
                return "Offline";
            }else{
                return "Online";
            }
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

            // console.log(this.videoCallParams.channel);
        },
        // End Initialize Channel & Call

        // End Video Call Settings
    }
}
</script>

<style>
.v-list{
    height: 200px;
    overflow-y: scroll;
    bottom: 95px;
}
</style>

