<template>
    <v-layout column class="fab-container">
            <div data-app>
                <v-row>
                    <v-col>
                        <v-card
                        shaped
                        outlined
                        class="d-flex flex-column fill-height">
                            <v-toolbar dark dense flat>
                                <v-toolbar-title> {{ messageUserName }} </v-toolbar-title>
                                <v-icon right dark @click="getPhoneCall"> mdi-phone </v-icon>
                            </v-toolbar>
                            
                            <v-card-text class="flex-grow-1 overflow-y-auto">
                                <template v-for="(message, index) in messages" >
                                    <div :class="message.user_id == currentID ? 'd-flex flex-row-reverse' : 'd-flex flex-row'" :key="index" v-bind:ChatID="message.chat_id">
                                        <v-menu offset-y>
                                            <template v-slot:activator="{ on }">
                                                <v-hover>
                                                    <v-chip
                                                        :color="message.user_id == currentID ? '#1565C0' : ''"
                                                        dark
                                                        style="height:40px; white-space: normal;"
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
                            <v-card-text>
                                <v-text-field 
                                v-model="newMessage"
                                placeholder="Type a message..." 
                                type="text"
                                no-details
                                outlined
                                append-outer-icon="mdi-send"
                                @click:append-outer="sendMessage"
                                @keyup.enter="sendMessage"
                                name="message"
                                > 
                                </v-text-field>
                            </v-card-text>
                        </v-card>
                    </v-col>
                    <v-col>
                        <v-card>
                            <v-subheader>User(s)</v-subheader>
                            <v-list rounded link >
                                <v-list-item-group color="#1976D2" >
                                    <template v-for="(user, index) in users" >
                                            <v-list-item :key="index" >
                                                <v-list-item-content v-on:click="getUserMessage(user.id, user.name)">
                                                    <v-list-item-title v-html="user.name">{{ user.name }}</v-list-item-title>
                                                    <v-list-item-subtitle v-html="user.email"> {{ user.email }}</v-list-item-subtitle>
                                                </v-list-item-content>
                                            </v-list-item>
                                            <v-divider v-if="user.divider" :key="user.name"></v-divider>
                                    </template>
                                </v-list-item-group>
                            </v-list>
                            
                            <v-card-subtitle style="text-align:center">{{ users.length }} Users</v-card-subtitle>       
                        </v-card>
                    </v-col>
                </v-row>
            </div>
    </v-layout>
</template>

<style>
    .fab-container {
        position: relative;
    }

    .v-btn{
        position: fixed;
        bottom: 10px;
        right: 10px;
    }

    .v-menu{
        bottom: 95px;
        right: 10px;
    }

    .v-list{
        height: 200px;
        overflow-y: scroll;
        bottom: 95px;
    }
</style>

<script>
    export default {
        data(){
            return{
                users: [],
                messages: [],
                isChecked: true,
                newMessage: '',
                currentID: this.$userId,
                messageUserName: '',
                ChatID: '',
            }
        },

        created(){
            this.getUserList();

            Echo.join('chat')
                .listen('MessageSent', (event) => {
                    this.messages.push(event.messages);
                });
        },

        methods: {
            getUserList(){
                axios.get('users').then(response => {
                    this.users = response.data;
                    
                })
            },

            getUserMessage(user_id, name){
                this.messageUserName = name,
                axios.post('http://127.0.0.1:8000/api/chatID', 
                {
                    user_id: this.$userId, 
                    to_user_id: user_id
                })
                .then(response => {
                    this.ChatID = response.data.id
                    // console.log(response.data.id)

                    axios.post('http://127.0.0.1:8000/api/chats', 
                    {
                        chat_id: response.data.id
                    })
                    .then(response => {
                        this.messages = response.data
                        // console.log(response.data)
                    })
                })
            },

            sendMessage(){
                console.log(this.ChatID)

                this.messages.push({
                    user_id: this.$userId,
                    body: this.newMessage
                });

                axios.post('send', 
                {
                    body: this.newMessage, 
                    chat_id: this.ChatID,
                    user_id: this.$userId
                })
                .then(response => {
                    // console.log(response.data)
                })

                this.newMessage = ''
            },

            getPhoneCall(){
                console.log('Clicked')
            }
        }
        
    }
</script>
