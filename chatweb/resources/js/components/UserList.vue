<template>
    <v-layout>
        <component :key="componentKey" :is="myComponent" :chatID="chatID" :currentID="currentID" :userName="userName"></component>
        <!-- <chat :chatID="ChatID" :currentID="currentID" :userName="userName"/>  -->
        <v-card 
        width="250"
        height="400">
            <v-subheader>User(s)</v-subheader>
            <v-list rounded link >
                <v-list-item-group color="#1976D2" >
                    <template v-for="(user, index) in users" >
                            <v-list-item :key="index" >
                                <v-list-item-content v-on:click="getUserMessage(user.id, user.name, componentKey = !componentKey)">
                                    <v-list-item-title v-html="user.name">{{ user.name }}</v-list-item-title>
                                    <!-- <v-list-item-subtitle v-html="user.email"> {{ user.email }}</v-list-item-subtitle> -->
                                </v-list-item-content>
                            </v-list-item>
                            <v-divider v-if="user.divider" :key="user.name"></v-divider>
                    </template>
                </v-list-item-group>
            </v-list>
        </v-card>
        
    </v-layout>
</template>

<style>
    .v-list{
        height: 200px;
        overflow-y: scroll;
        bottom: 95px;
    }
</style>

<script>
    import Chat from "./Chat";

    export default {
        components: {
            Chat
        },

        data(){
            return{
                users: [],
                currentID: this.$userId,
                chatID: '',
                userName: '',
                componentKey: 0,
                myComponent: null
            }
        },

        mounted(){
            this.getUserList();
        },

        methods: {
            getUserList(){
                axios.get('users').then(response => {
                    this.users = response.data;
                })
            },

            getUserMessage(user_id, name, isValid){
                this.userName = name,
                console.log(isValid)
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
