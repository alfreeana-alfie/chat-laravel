<template>
  <v-card>
    <v-toolbar
      color="#1565C0"
      dark
      >
      <template>
        <v-tabs fixed-tabs>
          <v-tab>Chats</v-tab>
            <v-tab-item >
                <v-card flat>
                <ChatComponent/>
                </v-card>
            </v-tab-item>
          <v-tab>Groups</v-tab>
            <v-tab-item >
                <v-card flat>
                <GroupChat/>
                </v-card>
            </v-tab-item>
        </v-tabs>
      </template>
    </v-toolbar>
  </v-card>
</template>

<script>
    import ChatComponent from "./ChatComponent";
    import GroupComponent from "./GroupComponent";
    import GroupChatComponent from "./GroupChatComponent";

    export default {
    name: 'App',
    components: {
        ChatComponent,
        GroupComponent,
        GroupChatComponent
    },

    data () {
      return {
        tab: null,
        items: [
          'Chats', 'Groups',
        ],
      }
    },
  }
</script>
