/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');
import Vue from 'vue';

Vue.component('example-com', require('./components/ExampleComponent.vue').default);
// Vue.component('main-component', require('./components/MainComponent.vue').default);
// Vue.component('chat', require('./components/Chat.vue').default);

Vue.component('user-list', require('./components/UserList.vue').default);
Vue.component('main-screen', require('./components/Main.vue').default);
Vue.component('video-chat', require('./components/VideoChatComponent.vue').default);

//  Streaming Components
Vue.component("broadcaster", require("./components/Broadcaster.vue").default);
Vue.component("viewer", require("./components/Viewer.vue").default);

Vue.component("combine", require("./components/Combine.vue").default);

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

