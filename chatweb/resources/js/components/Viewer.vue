<template>
  <div class="container">
    <div class="row">
      <div class="col-md-8 offset-md-2">
        <button class="btn btn-success" @click="joinBroadcast">
          Join Stream</button
        ><br />

        <video autoplay ref="viewer"></video>
        
      </div>
    </div>
  </div>
</template>

<script>
import Peer from "simple-peer";
import { getVideoPermissions } from "../helpers-video";

export default {
  name: "Viewer",
  props: [
    "auth_user_id",
    "stream_id",
  ],
  data() {
    return {
      streamingPresenceChannel: null,
      broadcasterPeer: null,
      broadcasterId: null,
    };
  },

  mounted() {
    const stream = getVideoPermissions();

    
  },

  methods: {
    joinBroadcast() {
       axios.get("/streaming/112acde2").then(res => { 
          console.log(res)
          this.initializeStreamingChannel();
          this.initializeSignalOfferChannel();
       }).catch(error => {
         console.log(error)
       });
    },
    initializeStreamingChannel() {
      this.streamingPresenceChannel = window.Echo.join(
        `streaming-channel.${this.stream_id}`
      );
    },
    createViewerPeer(incomingOffer, broadcaster) {
      const peer = new Peer({
        initiator: false,
        trickle: false,
      });
      // Add Transceivers
      // peer.addTransceiver("video");
      // peer.addTransceiver("audio");
      // Initialize Peer events for connection to remote peer
      this.handlePeerEvents(
        peer,
        incomingOffer,
        broadcaster,
        this.removeBroadcastVideo
      );
      this.broadcasterPeer = peer;
    },
    handlePeerEvents(peer, incomingOffer, broadcaster, cleanupCallback) {
      peer.on("signal", (data) => {
        axios
          .post("/stream-answer", {
            broadcaster,
            answer: data,
          })
          .then((res) => {
            console.log(res);
          })
          .catch((err) => {
            console.log(err);
          });
      });
      peer.on("stream", (stream) => {
        // display remote stream
        this.$refs.viewer.srcObject = stream;
      });
      peer.on("track", (track, stream) => {
        console.log("onTrack");
      });
      peer.on("connect", () => {
        console.log("Viewer Peer connected");
      });
      peer.on("close", () => {
        console.log("Viewer Peer closed");
        peer.destroy();
        cleanupCallback();
      });
      peer.on("error", (err) => {
        console.log("handle error gracefully");
      });
      const updatedOffer = {
        ...incomingOffer,
        sdp: `${incomingOffer.sdp}\n`,
      };
      peer.signal(updatedOffer);
    },
    initializeSignalOfferChannel() {
      window.Echo.private(`stream-signal-channel.${this.auth_user_id}`).listen(
        "StreamOffer",
        ({ data }) => {
          console.log("Signal Offer from private channel");
          this.broadcasterId = data.broadcaster;
          this.createViewerPeer(data.offer, data.broadcaster);
        }
      );
    },
    removeBroadcastVideo() {
      console.log("removingBroadcast Video");
      alert("Livestream ended by broadcaster");
      const tracks = this.$refs.viewer.srcObject.getTracks();
      tracks.forEach((track) => {
        track.stop();
      });
      this.$refs.viewer.srcObject = null;
    },
  },
};
</script>

<style scoped>
</style> 