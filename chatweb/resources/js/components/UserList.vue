<template>
    <v-layout>
        <!-- Chat Messages **START** -->
        <div id='chat' v-if="componentKey">
            <v-card width="420" height="550">
                    <v-toolbar dark>
                        <v-btn icon @click="closeChat"> 
                            <v-icon>mdi-close</v-icon>
                        </v-btn>
                        <v-toolbar-title> {{ userName }}</v-toolbar-title>
                        <v-spacer></v-spacer>
                        <v-btn icon @click="placeAudioCall(toUserId, userName)">
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
        <!-- Chat Messages **END** -->

        <!-- Video Call **START**  -->
        <div id="audio" v-if="audioCallPlaced">
            <v-card width="420" height="550">
                <v-toolbar dark flat>
                    <v-btn icon @click="closeChat"> 
                        <v-icon>mdi-close</v-icon>
                    </v-btn>
                    <v-toolbar-title>{{audioCallPartner}}</v-toolbar-title>
                </v-toolbar>
                <div class="row mt-5" id="audio-row">
                    <div class="col-12 audio-container" >
                        <video
                            ref="userAudio"
                            muted
                            playsinline
                            autoplay
                            class="cursor-pointer"
                            :class="isAudioFocusMyself === true ? 'user-audio' : 'partner-audio'"
                            @click="toggleAudioCameraArea"
                        />
                        <video
                            ref="partnerAudio"
                            playsinline
                            autoplay
                            class="cursor-pointer"
                            :class="isAudioFocusMyself === true ? 'partner-audio' : 'user-audio'"
                            @click="toggleAudioCameraArea"
                            v-if="audioCallParams.callAccepted"
                        />
                        <v-card-text v-else>
                            <div class="partner-audio" >
                                <div v-if="audioCallPartner" class="column items-center q-pt-xl">
                                <div class="col q-gutter-y-md text-center">
                                    <p class="q-pt-md">
                                    <strong>{{ audioCallPartner }}</strong>
                                    </p>
                                    <p>calling...</p>
                                </div>
                                </div>
                            </div>
                        </v-card-text>
                        <div class="action-btns">
                            <v-btn class="btn btn-info" color="#1565C0" @click="toggleAudioMuteAudio">
                                <v-icon>{{ audioMutedAudio ? "mdi-microphone" : "mdi-microphone-off" }}</v-icon>
                            </v-btn>
                            <!-- <v-btn class="btn btn-primary mx-4" color="#1565C0" @click="toggleAudioMuteVideo">
                                <v-icon>{{ audioMutedVideo ? "mdi-video" : "mdi-video-off" }}</v-icon>
                            </v-btn> -->
                            <v-btn class="btn btn-danger" color="#C62828" @click="endAudioCall">
                                <v-icon>mdi-phone-hangup</v-icon>
                            </v-btn>
                        </div>
                    </div>
                </div>
            </v-card>
        </div>
        <!-- Video Call **END**  -->

        <!-- Incoming Video Call **START** -->
        <div>
            <v-card>
                <div class="row" v-if="incomingAudioCallDialog">
                    <div class="col"> 
                        <p>Incoming Video Call from <strong>{{ audioCallerDetails.name }}</strong></p>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-danger" data-dismiss="modal" @click="declineAudioCall">Decline</button>
                            <button type="button" class="btn btn-success ml-5" @click="acceptAudioCall(audioCallerDetails.name)">Accept</button>
                        </div>
                    </div>
                </div>
            </v-card>
        </div>
        <!-- Incoming Video Call **END** -->

        <!-- Video Call **START**  -->
        <div id="video" v-if="videoCallPlaced">
            <v-card width="420" height="550">
                <v-toolbar dark flat>
                    <v-btn icon @click="closeChat"> 
                        <v-icon>mdi-close</v-icon>
                    </v-btn>
                    <v-toolbar-title>{{videoCallPartner}}</v-toolbar-title>
                </v-toolbar>
                <div class="row mt-5" id="video-row">
                    <div class="col-12 video-container" >
                        <video
                            ref="userVideo"
                            muted
                            playsinline
                            autoplay
                            class="cursor-pointer"
                            :class="isVideoFocusMyself === true ? 'user-video' : 'partner-video'"
                            @click="toggleVideoCameraArea"
                        />
                        <video
                            ref="partnerVideo"
                            playsinline
                            autoplay
                            class="cursor-pointer"
                            :class="isVideoFocusMyself === true ? 'partner-video' : 'user-video'"
                            @click="toggleVideoCameraArea"
                            v-if="videoCallParams.callAccepted"
                        />
                        <v-card-text v-else>
                            <div class="partner-video" >
                                <div v-if="videoCallPartner" class="column items-center q-pt-xl">
                                <div class="col q-gutter-y-md text-center">
                                    <p class="q-pt-md">
                                    <strong>{{ videoCallPartner }}</strong>
                                    </p>
                                    <p>calling...</p>
                                </div>
                                </div>
                            </div>
                        </v-card-text>
                        <div class="action-btns">
                            <v-btn class="btn btn-info" color="#1565C0" @click="toggleVideoMuteAudio">
                                <v-icon>{{ videoMutedAudio ? "mdi-microphone" : "mdi-microphone-off" }}</v-icon>
                            </v-btn>
                            <v-btn class="btn btn-primary mx-4" color="#1565C0" @click="toggleVideoMuteVideo">
                                <v-icon>{{ videoMutedVideo ? "mdi-video" : "mdi-video-off" }}</v-icon>
                            </v-btn>
                            <v-btn class="btn btn-danger" color="#C62828" @click="endVideoCall">
                                <v-icon>mdi-phone-hangup</v-icon>
                            </v-btn>
                        </div>
                    </div>
                </div>
            </v-card>
        </div>
        <!-- Video Call **END**  -->

        <!-- Incoming Video Call **START** -->
        <div>
            <v-card>
                <div class="row" v-if="incomingVideoCallDialog">
                    <div class="col"> 
                        <p>Incoming Video Call from <strong>{{ videoCallerDetails.name }}</strong></p>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-danger" data-dismiss="modal" @click="declineVideoCall">Decline</button>
                            <button type="button" class="btn btn-success ml-5" @click="acceptVideoCall(videoCallerDetails.name)">Accept</button>
                        </div>
                    </div>
                </div>
            </v-card>
        </div>
        <!-- Incoming Video Call **END** -->

        <!-- All Members **START** -->
        <v-card>
            <v-card width="420" height="550" class="pa-0">
                <v-card-text class="pa-0">
                    <v-row no-gutters align="center">
                        <v-col cols="6" md="4">
                            <v-card-text>
                                <v-icon>mdi-account-circle</v-icon> {{ authUserName }} </v-card-text>
                        </v-col>
                        <v-col cols="12" md="8">
                            <v-chip-group column>
                                <v-chip class="ma-1" small v-on:click="openAllMembers()"> All Members </v-chip>
                                <v-chip class="ma-1" small v-on:click="openFriendList()"> Friend List </v-chip>
                                <v-chip class="ma-1" small> Group List </v-chip>
                                <v-chip class="ma-1" small v-on:click="openSentFriendRequest()"> Friend Request </v-chip>
                                <v-chip class="ma-1" small v-on:click="openMerchant()"> Merchant </v-chip>
                            </v-chip-group>
                        </v-col>
                    </v-row>
                </v-card-text>

                <v-list v-if="userVlist">
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
                                            <span class="badge badge-light" style="display:none;">{{ getUserOnlineStatusVideo(user.id) }}</span>
                                        </v-list-item-subtitle>
                                    </v-list-item-content>
                                        <v-list-item-action>
                                            <v-btn icon v-on:click="sentFriendRequest(user.id, user.name)"><v-icon>mdi-account-plus</v-icon></v-btn>
                                            <v-card-text v-if="sentRequest">Sent</v-card-text>
                                        </v-list-item-action>
                                </v-list-item>
                                <v-divider v-if="user.divider" :key="user.name"></v-divider>
                        </template>
                    </v-list-item-group>
                </v-list>

                <v-list v-if="merchantVlist">
                    <v-list-item-group color="#1976D2" v-model="model">
                        <template v-for="(user, index) in allmerchants" >
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
                                            <span class="badge badge-light" style="display:none;">{{ getUserOnlineStatusVideo(user.id) }}</span>
                                        </v-list-item-subtitle>
                                    </v-list-item-content>
                                </v-list-item>
                                <v-divider v-if="user.divider" :key="user.name"></v-divider>
                        </template>
                    </v-list-item-group>
                </v-list>

                <v-list v-if="friendRequestVlist">
                    <v-list-item-group color="#1976D2" v-model="model">
                        <template v-for="(user, index) in allFriendRequest" >
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
                                            <span class="badge badge-light" style="display:none;">{{ getUserOnlineStatusVideo(user.id) }}</span>
                                        </v-list-item-subtitle>
                                    </v-list-item-content>
                                    <v-list-item-action>
                                            <v-card-text>Sent</v-card-text>
                                        </v-list-item-action>
                                </v-list-item>
                                <v-divider v-if="user.divider" :key="user.name"></v-divider>
                        </template>
                    </v-list-item-group>
                </v-list>

                <v-list v-if="friendVlist">
                    <v-list-item-group color="#1976D2" v-model="model">
                        <template v-for="(user, index) in allFriendList">
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
                                            <span class="badge badge-light" style="display:none;">{{ getUserOnlineStatusVideo(user.id) }}</span>
                                        </v-list-item-subtitle>
                                    </v-list-item-content>
                                    <v-list-item-action>
                                        <v-col>
                                            <v-btn v-on:click="acceptFriend(user.id)">Accept</v-btn>
                                            <v-btn>Reject</v-btn>
                                        </v-col>
                                    </v-list-item-action>
                                </v-list-item>
                                <v-divider v-if="user.divider" :key="user.name"></v-divider>
                        </template>
                    </v-list-item-group>
                </v-list>
            </v-card> 
        </v-card>
        
        <!-- All Members **END** -->
    </v-layout>
</template>


<script>
import Chat from "./Chat";
import Peer from "simple-peer";
import { getVideoPermissions } from "../helpers-video";
import { getAudioPermissions } from "../helpers-audio";

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
            userVlist: true,
            merchantVlist: false,
            friendRequestVlist: false,
            friendVlist: false,
            sentRequest: false,

            // Message
            messages: [],
            newMessage: '',

            // User
            currentID: this.$userId,
            chatID: '',
            userName: '', 
            toUserId: '',
            allusers: [],
            allmerchants: [],
            allFriendRequest: [],
            allFriendList: [],
            isOpenChat: false,
            componentKey: 0, 
            model: 1,

            // Video Call
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

            // Audio Call
            isAudioFocusMyself: true,
            audioCallPlaced: false,
            audioCallPartner: null,
            audioMutedAudio: false,
            audioMutedVideo: false,
            audioCallParams: {
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

    mounted(){
        this.getUserList();
        this.getMerchantList();
        this.getSentFriendRequest();
        this.getFriendList();

        this.initializeVideoChannel();
        this.initializeVideoCallListeners(); 

        this.initializeAudioChannel();
        this.initializeAudioCallListeners();
    },

    computed: {
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

        // Video Computed
        incomingAudioCallDialog() {
        if (
            this.audioCallParams.receivingCall &&
            this.audioCallParams.caller !== this.authuserid
        ) {
            return true;
        }
        return false;
        },

        audioCallerDetails() {
        if (
            this.audioCallParams.caller &&
            this.audioCallParams.caller !== this.authuserid
        ) {
            const incomingCaller = this.allusers.filter(
            (user) => user.id === this.audioCallParams.caller
            );
            return {
            id: this.audioCallParams.caller,
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

        getMerchantList(){
            axios.get('user-merchant').then(response => {
                this.allmerchants = response.data;
            })
        },

        openAllMembers(){
            this.userVlist = true;
            this.merchantVlist = false;
            this.friendRequestVlist = false;
            this.friendVlist = false;
        },

        openMerchant(){
            this.merchantVlist = true;
            this.userVlist = false; 
            this.friendRequestVlist = false;  
            this.friendVlist = false;     
        },

        openSentFriendRequest(){
            this.merchantVlist = false;
            this.userVlist = false; 
            this.friendRequestVlist = true;   
            this.friendVlist = false;
        },

        openFriendList(){
            this.merchantVlist = false;
            this.userVlist = false; 
            this.friendRequestVlist = false;
            this.friendVlist = true;  
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

            this.messages.push({
                user_id: this.$userId,
                body: this.newMessage
            });

            this.newMessage = ''
        },

        getSentFriendRequest() {
            axios.post('getSentFriendRequest', 
            {
                user_id: this.$userId,
            })
            .then(response => {
                this.allFriendRequest = response.data;
                console.log(response.data);
            })
            .catch((error) => {
                console.log(error);
            })
        },

        getFriendList(){
            axios.post('getFriendList', 
            {
                to_user_id: this.$userId,
            })
            .then(response => {
                this.allFriendList = response.data;
                console.log(response.data);
            })
            .catch((error) => {
                console.log(error);
            })
        },

        getUserOnlineStatus(id) {
            const onlineUserIndex = this.audioCallParams.users.findIndex(
                (data) => data.id === id
            );
            if (onlineUserIndex < 0) {
                return "Offline";
            }else{
                return "Online";
            }
        },

        getUserOnlineStatusVideo(id) {
            const onlineUserIndex = this.audioCallParams.users.findIndex(
                (data) => data.id === id
            );
            if (onlineUserIndex < 0) {
                return "Offline";
            }else{
                return "Online";
            }
        },

        sentFriendRequest(userID, name){
            this.allFriendRequest.push({
                name: name
            });

            axios.post('sendRequest', 
            {
                user_id: this.$userId, 
                to_user_id: userID,
                status: 'Pending'
            })
            .then(response => {
                console.log(response);
            })
            .catch((error) => {
                console.log(error);
            })

        },

        acceptFriend(userID){
            axios.post('acceptFriend', 
            {
                to_user_id: this.$userId,
                user_id: userID, 
            })
            .then(response => {
                console.log(response);
            })
            .catch((error) => {
                console.log(error);
            })  
        },
        
        /* Video Call --START-- */
        initializeVideoChannel() {
            this.videoCallParams.channel = window.Echo.join("Demo");
        },

        getVideoMediaPermission() {
        return getVideoPermissions()
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
            this.videoCallPlaced = true;
            this.videoCallPartner = name;
            console.log(name);

            await this.getVideoMediaPermission();
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

        async acceptVideoCall(name) {
            
            this.videoCallPlaced = true;
            this.videoCallParams.callAccepted = true;
            this.videoCallPartner = name;
            console.log(name);

            await this.getVideoMediaPermission();

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

        declineVideoCall(){
            this.videoCallParams.receivingCall = false;
            document.getElementById("chatCard").style.display = "block";
        },

        endVideoCall(){
            if(!this.videoMutedVideo) this.toggleVideoMuteVideo();
            if(!this.videoMutedAudio) this.toggleVideoMuteAudio();

            this.stopStreamedVideoCall(this.$refs.userVideo);
            if (this.authuserid === this.videoCallParams.caller) {
                this.videoCallParams.peer1.destroy();
            } else {
                this.videoCallParams.peer2.destroy();
            }
            this.videoCallParams.channel.pusher.channels.channels[
                "presence-Demo"
            ].disconnect();

            setTimeout(() => {
                this.videoCallPlaced = false;
            }, 3000);
            
            
        },

        toggleVideoCameraArea() {
            if (this.videoCallParams.callAccepted) {
                this.isVideoFocusMyself = !this.isVideoFocusMyself;
            }
        },

        toggleVideoMuteAudio(){
            if(this.videoMutedAudio){
                this.$refs.userVideo.srcObject.getAudioTracks()[0].enabled = true;
                this.videoMutedAudio = false;
            }else{
                this.$refs.userVideo.srcObject.getAudioTracks()[0].enabled = false;
                this.videoMutedAudio = true;
            }
        },

        toggleVideoMuteVideo(){
            if (this.videoMutedVideo) {
                this.$refs.userVideo.srcObject.getVideoTracks()[0].enabled = true;
                this.videoMutedVideo = false;
            } else {
                this.$refs.userVideo.srcObject.getVideoTracks()[0].enabled = false;
                this.videoMutedVideo = true;
            }
        },

        stopStreamedVideoCall(videoElem) {
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

        /* Video Call --START-- */
        initializeAudioChannel() {
            this.audioCallParams.channel = window.Echo.join("DemoAudio");
        },

        getAudioMediaPermission() {
        return getAudioPermissions()
            .then((stream) => {
            this.audioCallParams.stream = stream;
            if (this.$refs.userAudio) {
                this.$refs.userAudio.srcObject = stream;
            }
            })
            .catch((error) => {
            console.log(error);
            });
        },

        initializeAudioCallListeners() {
            this.audioCallParams.channel.here((users) => {
                this.audioCallParams.users = users;
            });

            this.audioCallParams.channel.joining((user) => {
                // check user availability
                const joiningUserIndex = this.audioCallParams.users.findIndex(
                    (data) => data.id === user.id
                );
                if (joiningUserIndex < 0) {
                    this.audioCallParams.users.push(user);
                }
            });
            this.audioCallParams.channel.leaving((user) => {
                const leavingUserIndex = this.audioCallParams.users.findIndex(
                    (data) => data.id === user.id
                );
                    this.audioCallParams.users.splice(leavingUserIndex, 1);
            });

            // listen to incomming call
            this.audioCallParams.channel.listen("StartAudioChat", ({ data }) => {
                console.log(data);
                if (data.type === "incomingCall") {
                // add a new line to the sdp to take care of error
                const updatedSignal = {
                    ...data.signalData,
                    sdp: `${data.signalData.sdp}\n`,
                };
                this.audioCallParams.receivingCall = true;
                this.audioCallParams.caller = data.from;
                this.audioCallParams.callerSignal = updatedSignal;
                }
            });
        },

        async placeAudioCall(id, name){ 
            this.audioCallPlaced = true;
            this.audioCallPartner = name;
            // console.log(name);

            await this.getAudioMediaPermission();
            this.audioCallParams.peer1 = new Peer({
                initiator: true,
                trickle: false,
                stream: this.audioCallParams.stream,
            });

            this.audioCallParams.peer1.on("signal", (data) => {
                axios.post("/audio/call-user", {
                    user_to_call: id,
                    signal_data: data,
                    from: this.authUserID,
                }).then((response) => {
                    console.log(response);
                }).catch((error) => {
                    console.log(error);
                });
            });

            this.audioCallParams.peer1.on("stream", (stream) => {
                console.log("Call Streaming...");
                if (this.$refs.partnerAudio){
                    this.$refs.partnerAudio.srcObject = stream;
                }
            });

            this.audioCallParams.peer1.on("connect", () => {
                console.log("Peer Connected!")
            });

            this.audioCallParams.peer1.on("error", (error) => {
                console.log(error);
            });

            this.audioCallParams.peer1.on("close", () => {
                console.log("Call Closed Caller");
            });

            this.audioCallParams.channel.listen("StartAudioChat", ({data}) => {
                if(data.type == "callAccepted"){
                    if (data.signal.renegotiate) {
                        console.log("renegotating");
                    }
                    if(data.signal.sdp){
                        this.audioCallParams.callAccepted = true;
                        const updateSignal = {
                            ...data.signal,
                            sdp: `${data.signal.sdp}\n`,
                        };
                        this.audioCallParams.peer1.signal(updateSignal);
                    }
                }
            });
            document.getElementById("chat").style.display = "none";
        },

        async acceptAudioCall(name) {
            this.audioCallPlaced = true;
            this.audioCallParams.callAccepted = true;
            this.audioCallPartner = name;
            // console.log(name);

            await this.getAudioMediaPermission();

            this.audioCallParams.peer2 = new Peer({
                initiator: false,
                trickle: false,
                stream: this.audioCallParams.stream,
            });

            this.audioCallParams.receivingCall = false;
            this.audioCallParams.peer2.on("signal", (data) => {
                axios.post("/audio/accept-call", {
                    signal: data,
                    to: this.audioCallParams.caller,
                }).then((response) => {
                    console.log(response);
                })
                .catch((error) => {
                    console.log(error);
                });
            });

            this.audioCallParams.peer2.on("stream", (stream) => {
                this.audioCallParams.callAccepted = true;
                this.$refs.partnerAudio.srcObject = stream;
            });

            this.audioCallParams.peer2.on("connect", () => {
                console.log("Peer02 Connected");
                this.audioCallParams.callAccepted = true;
            });

            this.audioCallParams.peer2.on("error", (err) => {
                console.log(err);
            });

            this.audioCallParams.peer2.on("close", () => {
                console.log("Call Closed Accepter");
            });

            this.audioCallParams.peer2.signal(this.audioCallParams.callerSignal);
            document.getElementById("chat").style.display = "none";
        },

        declineAudioCall(){
            this.audioCallParams.receivingCall = false;
            document.getElementById("chatCard").style.display = "block";
        },

        endAudioCall(){
            // if(!this.audioMutedVideo) this.toggleAudioMuteVideo();
            if(!this.audioMutedAudio) this.toggleAudioMuteAudio();

            this.stopStreamedAudioCall(this.$refs.userAudio);
            if (this.authUserID === this.audioCallParams.caller) {
                this.audioCallParams.peer1.destroy();
            } else {
                this.audioCallParams.peer2.destroy();
            }
            this.audioCallParams.channel.pusher.channels.channels[
                "presence-DemoAudio"
            ].disconnect();

            setTimeout(() => {
                this.audioCallPlaced = false;
            }, 3000);
        },

        toggleAudioCameraArea() {
            if (this.audioCallParams.callAccepted) {
                this.isAudioFocusMyself = !this.isAudioFocusMyself;
            }
        },

        toggleAudioMuteAudio(){
            if(this.audioMutedAudio){
                this.$refs.userAudio.srcObject.getAudioTracks()[0].enabled = true;
                this.audioMutedAudio = false;
            }else{
                this.$refs.userAudio.srcObject.getAudioTracks()[0].enabled = false;
                this.audioMutedAudio = true;
            }
        },

        toggleAudioMuteVideo(){
            if (this.audioMutedVideo) {
                this.$refs.userAudio.srcObject.getVideoTracks()[0].enabled = true;
                this.audioMutedVideo = false;
            } else {
                this.$refs.userAudio.srcObject.getVideoTracks()[0].enabled = false;
                this.audioMutedVideo = true;
            }
        },

        stopStreamedAudioCall(videoElem) {
            const stream = videoElem.srcObject;
            const tracks = stream.getTracks();
            tracks.forEach((track) => {
                track.stop();
            });
            videoElem.srcObject = null;
            document.getElementById("audio").style.display = "none";
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

#audio-row {
  width: 410px;
  height: 500px;
  margin: 0;
}

#incoming-call-card {
  border: 1px solid #0acf83;
}

.audio-container {
  width: 410px;
  height: 500px;
  max-width: 90vw;
  max-height: 50vh;
  margin: 0;
  position: relative;
  background-color: #fff;
}

.audio-container .user-audio {
  width: 30%;
  position: absolute;
  left: 10px;
  bottom: 10px;
  border: 1px solid #fff;
  border-radius: 6px;
  z-index: 2;
}

.audio-container .partner-audio {
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

.audio-container .action-btns {
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
  .audio-container {
    height: 50vh;
  }
}
</style>

