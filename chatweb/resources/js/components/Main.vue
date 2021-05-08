<template>
<v-container >
    <UserList class="user-container" :authUserName="authUserName" :authUserID="authUserID"></UserList>
    <v-fab-transition>
        <v-btn
        color="pink"
        dark
        bottom
        right
        fab
        @click="hidden = !hidden"
        class="v-btn-bottom">
        {{ hidden ? 'Show' : 'Hide' }}
        </v-btn>
    </v-fab-transition>
    <!-- <VideoChatComponent :allusers="allusers" :authUserID="authUserID"></VideoChatComponent> -->
</v-container>
</template>

<style>
.v-btn-bottom {
    bottom: 0;
    right: 0;
    position: fixed;
    margin: 16px 16px 16px 16px;
  }
.container{
    position: relative;
}
.user-container {
    position: fixed;
    bottom: 0;
    right: 0;
    margin: 16px 16px 82px 16px;
}
</style>

<script>
    import UserList from "./UserList";
    import VideoChatComponent from "./VideoChatComponent";

    export default {
        components: { UserList, VideoChatComponent },

        props: ['UserName'],

        data(){
            return{
                hidden: false,
                myComponent: null,
                allusers: {},
                myComponent: null,
                authUserID: this.$userId,
                authUserName: this.UserName
            }
        },
        mounted() {
            this.getUserList(); 

            setInterval(() =>{
                this.getUserList();
            }, 20000);
        },
        methods: {
            getUserList(){
                axios.get('user-member').then(response => {
                    this.allusers = response.data;
                })
                this.myComponent = 'video-chat';
            }
        }
    }
</script>

