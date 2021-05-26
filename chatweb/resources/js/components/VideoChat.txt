<template>
        <div class="content">
            <div class="title m-b-md">
                Video Chat Rooms
            </div>
            
            <v-card>
                <v-card-text>Create or Join a Room</v-card-text>
                <v-card-text>
                    <div id="media-div"></div>
                </v-card-text>
                <v-text-field
                    ma-0 pa-0
                    v-model="roomName"
                    placeholder="Type a message..." 
                    type="text"
                    regular
                    single-line
                    clearable
                    filled
                    append-icon="mdi-send"
                    @click:append="createRoom"
                    @keyup.enter="createRoom"
                    name="name"
                    > 
                </v-text-field>
            </v-card>
            <v-btn v-on:click="joinRoom()">Click LInk</v-btn>
            
        </div>
</template>

<script>
export default {
    data() {
        return {
            roomName: 'fff',
        }
    },

    methods: {
        createRoom() {
            axios.post('room/create', 
            {
                roomName: this.roomName,
            })
            .then(response => {
                console.log(response);
            })
            .catch(error => {
                console.log(error);
            })
        },

        joinRoom(){
            axios.get('room/join/' + this.roomName, 
            {
                roomName: this.roomName,
            })
            .then(response => {
                console.log(response.data.accessToken);
                this.initTwilio(response.data.roomName, response.data.accessToken);
            })
            .catch(error => {
                console.log(error);
            })
        },

        participantConnected(participant) {
            console.log('Participant "%s" connected', participant.identity);

            const div = document.createElement('div');
            div.id = participant.sid;
            div.setAttribute("style", "float: left; margin: 10px;");
            div.innerHTML = "<div style='clear:both'>" + participant.identity + "</div>";

            participant.tracks.forEach(function(track) {
                this.trackAdded(div, track)
            });

            participant.on('trackAdded', function(track) {
                this.trackAdded(div, track)
            });
            participant.on('trackRemoved', this.trackRemoved(participant.tracks));

            document.getElementById('media-div').appendChild(div);
        },

        participantDisconnected(participant) {
            console.log('Participant "%s" disconnected', participant.identity);

            participant.tracks.forEach(this.trackRemoved(participant.tracks));
            document.getElementById(participant.sid).remove();
        },

        trackAdded(div, track) {
            div.appendChild(track.attach());
            var video = div.getElementsByTagName("video")[0];
            if (video) {
                video.setAttribute("style", "max-width:300px;");
            }
        },

        trackRemoved(track) {
            track.detach().forEach( function(element) { element.remove() });
        },

        initTwilio(roomName, accessToken) {
            new Twilio.Video.createLocalTracks({
            audio: true,
            video: { width: 300 }
            }).then(function(localTracks) {
            return Twilio.Video.connect( accessToken, {
                name: roomName,
                tracks: localTracks,
                video: { width: 300 }
            });
            }).then(function(room) {
            console.log('Successfully joined a Room: ', room.name);

            room.participants.forEach(data => {
                this.participantConnected(data)
            });

            var previewContainer = document.getElementById(room.localParticipant.sid);
            if (!previewContainer || !previewContainer.querySelector('video')) {
                // this.participantConnected(room.localParticipant);
            }

            room.on('participantConnected', function(participant) {
                this.participantConnected(participant);
            });

            room.on('participantDisconnected', function(participant) {
                this.participantDisconnected(participant);
            });
            });
        },

        
    }
}
</script>