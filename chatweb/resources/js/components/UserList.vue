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
                    <div id="chatCard" flat height="550">
                        <v-card flat height="550">
                            <v-card-text class="flex-grow-1 overflow-y-auto" style="height: 550px;">
                                <template v-for="(message, index) in messages" >
                                    <div :class="message.user_id != currentID ? 'd-flex flex-row' : 'd-flex flex-row-reverse'" :key="index">
                                        <v-menu offset-y>
                                            <template v-slot:activator="{ on }">
                                                <v-hover>
                                                    <v-chip
                                                        :color="message.user_id != currentID ? '' : '#1565C0'"
                                                        dark
                                                        style="height:auto; white-space: normal;"
                                                        class="pa-0 mb-2 ma-0"
                                                        v-on="on">
                                                        <v-col>
                                                            <p style="margin:0;text-align:left;font-size:14px">{{ message.body }}</p>
                                                            <p style="margin:0;text-align:right;font-size:12px">{{ moment(message.created_at).format("llll") }}</p>
                                                        </v-col>
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

        <!-- Chat Group Messages **START** -->
        <div id='chat' v-if="componentKeyGroup">
            <v-card width="420" height="550">
                    <v-toolbar dark>
                        <v-btn icon @click="closeChat"> 
                            <v-icon>mdi-close</v-icon>
                        </v-btn>
                        <v-toolbar-title> {{ groupName }}</v-toolbar-title>
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
                    <div id="chatCard" flat height="550">
                        <v-card flat height="550">
                            <v-card-text class="flex-grow-1 overflow-y-auto" style="height: 550px;">
                                <template v-for="(message, index) in groupMessages" >
                                    <div :class="message.user_id != currentID ? 'd-flex flex-row' : 'd-flex flex-row-reverse'" :key="index">
                                        <v-menu offset-y>
                                            <template v-slot:activator="{ on }">
                                                <v-hover>
                                                    <v-chip
                                                        :color="message.user_id != currentID ? '' : '#1565C0'"
                                                        dark
                                                        style="height:auto; white-space: normal; margin:0;"
                                                        class="pa-0 mb-2 ma-0"
                                                        v-on="on">
                                                        <v-col>
                                                            <p style="margin-bottom:2px;text-align:left;font-size:14px"><strong>{{ message.user_name }}</strong></p>
                                                            <p style="margin:0;text-align:left;font-size:14px">{{ message.body }}</p>
                                                            <p style="margin:0;text-align:right;font-size:12px">{{ moment(message.created_at).format("lll") }}</p>
                                                        </v-col>
                                                    </v-chip>
                                                </v-hover>
                                            </template>
                                        </v-menu>
                                    </div>
                                </template>
                            </v-card-text>
                            <v-text-field
                                    ma-0 pa-0
                                    v-model="newGroupMessage"
                                    placeholder="Type a message..." 
                                    type="text"
                                    regular
                                    single-line
                                    clearable
                                    filled
                                    append-icon="mdi-send"
                                    @click:append="sendGroupMessage"
                                    @keyup.enter="sendGroupMessage"
                                    name="message"
                                    > 
                                </v-text-field>
                        </v-card>
                    </div>
                </v-card>
        </div>
        <!-- Chat Group Messages **END** -->

        <!-- Audio Call **START**  -->
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
        <!-- Audio Call **END**  -->

        <!-- Incoming Audio Call **START** -->
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
        <!-- Incoming Audio Call **END** -->

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
                                <v-chip class="ma-1" small v-on:click="openGroupList()"> Group List </v-chip>
                                <v-chip class="ma-1" small v-on:click="openSentFriendRequest()"> Friend Request </v-chip>
                                <v-chip class="ma-1" small v-on:click="openMerchant()"> Merchant </v-chip>
                            </v-chip-group>
                        </v-col>
                    </v-row>
                </v-card-text>

        <!-- All Members **START** -->
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
        <!-- All Members **END** -->

        <!-- Merchants **START** -->
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
            <!-- Merchants **END** -->

            <!-- Friend Request **START** -->
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
            <!-- Friend Request **END** -->

            <!-- Friend List **START** -->
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
                                        <v-col v-if="colFriendStatus">
                                            <v-btn v-on:click="acceptFriend(user.id)">Accept</v-btn>
                                            <v-btn v-on:click="rejectFriend(user.id)">Reject</v-btn>
                                        </v-col>
                                    </v-list-item-action>
                                </v-list-item>
                                <v-divider v-if="user.divider" :key="user.name"></v-divider>
                        </template>
                    </v-list-item-group>
                </v-list>
            <!-- Friend List **END** -->

            <!-- Group List **START** -->
                <v-list v-if="groupVlist">
                    <v-col v-if="!addGroupChecked">
                            <v-icon>mdi-account-group</v-icon>
                            <v-btn text v-on:click="checkGroup(addGroupChecked = !addGroupChecked)"> Add Group</v-btn>
                        </v-col>
                    <v-list-item-group color="#1976D2" v-model="model" v-if="!addGroupChecked">
                        <template v-for="(user, index) in allGroups">
                                <v-list-item :key="index" > 
                                    <v-list-item-avatar>
                                        <v-icon>
                                            mdi-account-circle
                                        </v-icon>
                                    </v-list-item-avatar>
                                        <v-list-item-content v-on:click="fetchGroupMessage(user.id, user.name, componentKeyGroup++)">
                                            <v-list-item-title v-html="user.name">{{ user.name }}</v-list-item-title>
                                        </v-list-item-content>
                                </v-list-item>
                        </template>
                    </v-list-item-group>
                    <v-list-item-group color="#1976D2" v-model="model" v-if="addGroupChecked">
                        <v-row v-if="addGroupChecked" >
                            <v-text-field
                                v-model="newGroupName"
                                filled
                                label="Group Name"
                                ></v-text-field>
                            <v-btn text v-on:click="createGroup(newGroupName)"> Confirm</v-btn>
                        </v-row>
                        <template v-for="(user, index) in allusers">
                                <v-list-item :key="index" > 
                                    <v-list-item-avatar>
                                        <v-icon>
                                            mdi-account-circle
                                        </v-icon>
                                    </v-list-item-avatar>
                                    <template v-slot:default="{ active }">
                                        <v-list-item-content>
                                            <v-list-item-title v-html="user.name">{{ user.name }}</v-list-item-title>
                                            <v-list-item-subtitle>
                                                <span class="badge badge-light">{{ getUserOnlineStatus(user.id) }}</span>
                                                <span class="badge badge-light" style="display:none;">{{ getUserOnlineStatusVideo(user.id) }}</span>
                                                <!-- <span>Checked names: {{ chosenUserID }}</span> -->
                                            </v-list-item-subtitle>
                                        </v-list-item-content>
                                        <v-list-item-action>
                                            <v-checkbox
                                                :input-value="active"
                                                color="deep-purple accent-4"
                                                v-model="chosenUserID"
                                                :value="user.id"
                                                ></v-checkbox>
                                        </v-list-item-action>
                                        
                                    </template>
                                    
                                </v-list-item>
                                
                                <v-divider v-if="user.divider" :key="user.name"></v-divider>
                        </template>
                        
                    </v-list-item-group>
                </v-list>
            <!-- Group List **END** -->
            </v-card> 
        </v-card>
        
    </v-layout>
</template>


<script>
import Chat from "./Chat";
import Peer from "simple-peer";
import moment from "moment";
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
            groupVlist: false,
            sentRequest: false,
            colFriendStatus: true,
            addGroupChecked: false,

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
            allGroups: [],
            isOpenChat: false,
            componentKey: 0, 
            componentKeyGroup: 0,
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

            chosenUserID: [],
            newGroupName: '',
            groupMessages: [],
            groupName: '',
            newGroupMessage: '',
            GroupID: '',
            moment: moment,
            dateMessage: '',
        }
    },

    created(){
        Echo.join('chat')
            .listen('MessageSent',(event) => {
                this.messages.push(event.message);
            })

        Echo.join('group-chat')
            .listen('GroupMessageSent',(event) => {
                this.groupMessages.push(event.message);
            })

        Echo.join('Demo')
            .listen('StartVideoChat',(event) => {
                // this.groupMessages.push(event.message);
                console.log(event);
            })
    },

    mounted(){
        this.getUserList();
        this.getMerchantList();
        this.getSentFriendRequest();
        this.getFriendList();
        this.getGroupList();

        this.initializeVideoChannel();
        this.initializeVideoCallListeners(); 

        // this.initializeAudioChannel();
        // this.initializeAudioCallListeners();
    },

    computed: {
        // Video Computed
        incomingVideoCallDialog() {
            // console.log(this.videoCallParams.receivingCall)
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
        createGroup(groupName) {
            // console.log(this.chosenUserID)
            // console.log(groupName)

            this.chosenUserID.push(this.$userId)
            axios.post('add-group', 
            {
                name: this.groupName,
                users: this.chosenUserID
            })
            .then(response => {
                this.messages = response.data
                // console.log(response.data)
            })
            .catch(error => {
                // console.log(error);
            })
        },

        getUserList(){
            
            axios.get('user-member').then(response => {
                this.allusers = response.data;
            })
        },
        
        fetchGroupMessage(groupID, groupName) {
            this.groupName = groupName;
            this.groupID = groupID;
            // fetchMessages-group
            axios.post('fetchMessages-group', 
            {
                group_id: groupID
            })
            .then(response => {
                this.groupMessages = response.data
                this.componentKeyGroup += 1;
                // console.log(response.data)
            })
            .catch(error => {
                console.log(error);
            })
        },

        sendGroupMessage(){
            // console.log(this.newGroupMessage);
            this.groupMessages.push({
                user_id: this.$userId,
                user_name: this.authUserName,
                body: this.newGroupMessage
            });

            axios.post('send-group', 
            {
                body: this.newGroupMessage, 
                group_id: this.groupID,
                user_id: this.$userId,
                user_name: this.authUserName
            })
            .then(response => {
                console.log(response)
            })
            .catch((error) => {
                console.log(error);
            })

            this.newGroupMessage = ''
        },

        getMerchantList(){
            axios.get('user-merchant').then(response => {
                this.allmerchants = response.data;
            })
        },

        getGroupList(){
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
                    this.allGroups = response.data
                    // console.log(response.data)
                })
            })
        },

        openAllMembers(){
            this.userVlist = true;
            this.merchantVlist = false;
            this.friendRequestVlist = false;
            this.friendVlist = false;
            this.groupVlist = false;
        },

        openMerchant(){
            this.merchantVlist = true;
            this.userVlist = false; 
            this.friendRequestVlist = false;  
            this.friendVlist = false;    
            this.groupVlist = false;
        },

        openSentFriendRequest(){
            this.merchantVlist = false;
            this.userVlist = false; 
            this.friendRequestVlist = true;   
            this.friendVlist = false;
            this.groupVlist = false;
        },

        openFriendList(){
            this.merchantVlist = false;
            this.userVlist = false; 
            this.friendRequestVlist = false;
            this.friendVlist = true; 
            this.groupVlist = false; 
        },

        openGroupList(){
            this.merchantVlist = false;
            this.userVlist = false; 
            this.friendRequestVlist = false;
            this.friendVlist = false; 
            this.groupVlist = true; 
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
                user_id: this.$userId,
                body: this.newMessage
            });

            axios.post('send', 
            {
                body: this.newMessage, 
                chat_id: this.chatID,
                user_id: this.$userId
            })
            .then(response => {
                // this.allusers = response.data
                // this.allusers = response.data
            })
            .catch((error) => {
                console.log(error);
            })

            this.newMessage = ''
        },

        getSentFriendRequest() {
            axios.post('getSentFriendRequest', 
            {
                user_id: this.$userId,
            })
            .then(response => {
                this.allFriendRequest = response.data;
                // console.log(response.data);
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
                // console.log(response.data);
            })
            .catch((error) => {
                console.log(error);
            })
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

        acceptFriend(userID, name){
            // this.allFriendList.push({
            //     name: name
            // });

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

            this.colFriendStatus = false;
        },

        rejectFriend(userID, name){
            // this.allFriendList.push({
            //     name: name
            // });

            axios.post('rejectFriend', 
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

            this.colFriendStatus = false;
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
            const onlineUserIndex = this.videoCallParams.users.findIndex(
                (data) => data.id === id
            );
            if (onlineUserIndex < 0) {
                return "Offline";
            }else{
                return "Online";
            }
        },

        checkGroup(groupChecked) {
            return groupChecked;
        },

        addGroup(groupChecked) {
            return groupChecked;
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
            this.videoCallParams.channel = window.Echo.join("Demo");

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

                // console.log(data);
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
                // console.log(data);
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

.tab {
    display: inline-block;
    margin-left: 10px;
}
</style>