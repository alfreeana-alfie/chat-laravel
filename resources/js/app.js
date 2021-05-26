require('./bootstrap');

window.Vue = require('vue');
import Vue from 'vue';

Vue.component('user-list', require('./components/UserList.vue').default);
Vue.component('main-screen', require('./components/Main.vue').default);

//  Streaming Components
Vue.component("broadcaster", require("./components/Broadcaster.vue").default);
Vue.component("viewer", require("./components/Viewer.vue").default);

Vue.component('video-chat', require('./components/VideoChat.vue').default);

Vue.prototype.$userId = document.querySelector("meta[name='user-id']").getAttribute('content');

import Vuetify from 'vuetify';

Vue.use(Vuetify); 

const app = new Vue({
el: '#app',
vuetify: new Vuetify(),
   
});

Echo.private('chat')
  .listen('MessageSent', (e) => {
    this.messages.push({
      message: e.message.message
    });
});

