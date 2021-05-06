<template>
<v-container >
    <!-- <UserList class="user-container"></UserList>
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
    </v-fab-transition> -->
    <VideoChatComponent></VideoChatComponent>
</v-container>
    <!-- <v-container class="container">
        <v-row>
            <div data-app>
                <v-col>
                    <v-fab-transition>
                        <v-btn
                        color="pink"
                        dark
                        absolute
                        right
                        fab
                        @click="hidden = !hidden"
                        >
                        {{ hidden ? 'Show' : 'Hide' }}
                        </v-btn>
                    </v-fab-transition>
                </v-col>
                
            </div>
        </v-row>
        <UserList class="user-container"></UserList>
    </v-container> -->
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
        data: () => ({
            hidden: false,
            myComponent: null
        }),
        methods: {
            
        }
    }
</script>

