<template>
  <div class="container">
    <div class="row">
      <div class="col-md-8 offset-md-2">
        <button class="btn btn-success" @click="startStream">
          Start Stream</button
        ><br />
        <video autoplay ref="broadcaster"></video>

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
    props: [
        "auth_user_id"
    ],
    data(){
        return { 
            streamingPresenceChannel: null,
            streamingUsers: [],
            currentlyContactedUser: null,
            allPeers: {},
            broadcasterPeer: null,
            broadcasterId: null,
        };
    },

    computed: {
        streamId() {
        // you can improve streamId generation code. As long as we include the
        // broadcaster's user id, we are assured of getting unique streamiing link everytime.
        // the current code just generates a fixed streaming link for a particular user.
        return `112acde2`;
        },
        streamLink() {
        return `http://127.0.0.1:8000/streaming/${this.streamId}`;
        },
    },

    methods: {
        async startStream() {
            const stream = await getVideoPermissions();
            
            this.$refs.broadcaster.srcObject = stream;
            this.initializeStreamingChannel();
            this.initializeSignalAnswerChannel(); 
            this.isVisibleLink = true;
        },

        peerCreator(stream, user, signalCallback) {
        let peer;
        return {
            create: () => {
            peer = new Peer({
                initiator: true,
                trickle: false,
                stream: stream
            });
            },
            getPeer: () => peer,
            initEvents: () => {
            peer.on("signal", (data) => {
                // send offer over here.
                signalCallback(data, user);
            });
            peer.on("stream", (stream) => {
                console.log("onStream");
            });
            peer.on("track", (track, stream) => {
                console.log("onTrack");
            });
            peer.on("connect", () => {
                console.log("Broadcaster Peer connected");
            });
            peer.on("close", () => {
                console.log("Broadcaster Peer closed");
            });
            peer.on("error", (err) => {
                console.log("handle error gracefully");
            });
            },
        };
        },
        initializeStreamingChannel() {
        this.streamingPresenceChannel = window.Echo.join(
            `streaming-channel.${this.streamId}`
        );
        this.streamingPresenceChannel.here((users) => {
            this.streamingUsers = users;
        });
        this.streamingPresenceChannel.joining((user) => {
            console.log("New User", user);
            // if this new user is not already on the call, send your stream offer
            const joiningUserIndex = this.streamingUsers.findIndex(
            (data) => data.id === user.id
            );
            if (joiningUserIndex < 0) {
            this.streamingUsers.push(user);
            // A new user just joined the channel so signal that user
            this.currentlyContactedUser = user.id;
            this.$set(
                this.allPeers,
                `${user.id}`,
                this.peerCreator(
                this.$refs.broadcaster.srcObject,
                user,
                this.signalCallback
                )
            );
            // Create Peer
            this.allPeers[user.id].create();
            // Initialize Events
            this.allPeers[user.id].initEvents();
            }
        });
        this.streamingPresenceChannel.leaving((user) => {
            console.log(user.name, "Left");
            // destroy peer
            this.allPeers[user.id].getPeer().destroy();
            // delete peer object
            delete this.allPeers[user.id];
            // if one leaving is the broadcaster set streamingUsers to empty array
            if (user.id === this.auth_user_id) {
            this.streamingUsers = [];
            } else {
            // remove from streamingUsers array
            const leavingUserIndex = this.streamingUsers.findIndex(
                (data) => data.id === user.id
            );
            this.streamingUsers.splice(leavingUserIndex, 1);
            }
        });
        },
        initializeSignalAnswerChannel() {
        window.Echo.private(`stream-signal-channel.1`).listen(
            "StreamAnswer",
            ({ data }) => {
            console.log("Signal Answer from private channel");
            if (data.answer.renegotiate) {
                console.log("renegotating");
            }
            if (data.answer.sdp) {
                const updatedSignal = {
                ...data.answer,
                sdp: `${data.answer.sdp}\n`,
                };
                this.allPeers[this.currentlyContactedUser]
                .getPeer()
                .signal(updatedSignal);
            }
            }
        );
        },
        signalCallback(offer, user) {
        axios
            .post("/stream-offer", {
            broadcaster: this.auth_user_id,
            receiver: user,
            offer,
            })
            .then((res) => {
            console.log(res);
            })
            .catch((err) => {
            console.log(err);
            });
        },

        joinBroadcast() {
            this.initializeStreamingChannel();
            this.initializeSignalOfferChannel(); // a private channel where the viewer listens to incoming signalling offer
        },
        initializeStreamingChannel() {
        this.streamingPresenceChannel = window.Echo.join(
            `streaming-channel.${this.streamId}`
        );
        },
        createViewerPeer(incomingOffer, broadcaster) {
        const peer = new Peer({
            initiator: false,
            trickle: false,
        });
        // Add Transceivers
        peer.addTransceiver("video", { direction: "recvonly" });
        peer.addTransceiver("audio", { direction: "recvonly" });
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
        window.Echo.private(`stream-signal-channel.1`).listen(
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
    }

}
</script>