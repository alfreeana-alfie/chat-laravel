<template>
    <v-layout>
        <!-- Start Chat Component -->
        <component :key="componentKey" :is="myComponent" :chatID="chatID" :currentID="currentID" :userName="userName"></component>
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
                    <template v-for="(user, index) in users" >
                            <v-list-item :key="index" >
                                <v-list-item-avatar>
                                    <v-icon>
                                        mdi-account-circle
                                    </v-icon>
                                </v-list-item-avatar>
                                <v-list-item-content v-on:click="getUserMessage(user.id, user.name, componentKey = !componentKey)">
                                    <v-list-item-title v-html="user.name">{{ user.name }}</v-list-item-title>
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

export default {
    components: {
        Chat
    },

    props: ['authUserName'],

    data(){
        return{
            users: [],
            currentID: this.$userId,
            chatID: '',
            userName: '', 
            componentKey: 0, // Component Key for changing values component
            myComponent: null //Initiate Chat Component
        }
    },

    mounted(){
        this.getUserList();
        // console.log(this.authUserName)
    },

    methods: {
        // Get User List
        getUserList(){
            axios.get('user-member').then(response => {
                this.users = response.data;
            })
        },

        // Get Chat Room ID for messages
        getUserMessage(user_id, name, isValid){
            this.userName = name,
            // console.log(isValid)
            axios.post('http://127.0.0.1:8000/api/chatID', 
            {
                user_id: this.$userId, 
                to_user_id: user_id
            })
            .then(response => {
                this.chatID = response.data.id;
                console.log(this.chatID);
                
                this.myComponent = 'chat';
                this.componentKey += 1;
            })
        }
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

