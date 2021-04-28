<template>
 <div id='chat'>
   <v-card height="400" >
        <v-toolbar dark dense flat>
            <v-toolbar-title> {{ userName }}</v-toolbar-title>
        </v-toolbar>
   <v-card class="scroll" flat>
        <v-card-text class="flex-grow-1 overflow-y-auto">
                <template v-for="(message, index) in messages" >
                    <div :class="message.user_id == currentID ? 'd-flex flex-row-reverse' : 'd-flex flex-row'" :key="index">
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
   </v-card>
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
export default {
    props: ['chatID', 'currentID', 'userName'],
    

    data(){
        return{
            messages: [],
            newMessage: '',
            chat_id: this.chatID,
        }
    },

    mounted(){
        this.fetchMessages();

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
                // console.log(response.data)
            })

            this.newMessage = ''
        },
    }
}
</script>