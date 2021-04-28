<template>
    <v-container class="container">
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
                        <!-- <v-icon>mdi-chat</v-icon> -->
                        </v-btn>
                    </v-fab-transition>
                </v-col>
                
            </div>
        </v-row>
        <UserList class="user-container"></UserList>
    </v-container>
</template>

<style>
.container{
    position: relative;
}
.user-container {
    position: fixed;
    bottom: 85;
    right: 10;
}
</style>

<script>
    import UserList from "./UserList";

    export default {
        components: { UserList },
        data: () => ({
            hidden: false,
            myComponent: null
        }),
        methods: {
            loadComponent: function(){
                    this.myComponent = 'chat';
            }
        }
    }
</script>

