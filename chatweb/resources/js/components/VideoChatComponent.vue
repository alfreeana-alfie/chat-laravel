<template>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="btn-group" role="group">
                    <button
                    type="button"
                    class="btn btn-primary mr-2"
                    v-for="(user, index) in videoCallParams.users"
                    :key="index"
                    @click="getVideo()"
                    >
                    Call {{ user.name }}
                    </button>
                </div>
            </div>
        </div>

    <!--Placing Video Call-->
      <div class="row mt-5" id="video-row">
        <div class="col-12 video-container">
          <video
            ref="userVideo"
            muted
            playsinline
            autoplay
            class="cursor-pointer"
          />
          <video
            ref="partnerVideo"
            playsinline
            autoplay
            class="cursor-pointer"
          />
          <div class="partner-video">
            <div class="column items-center q-pt-xl">
              <div class="col q-gutter-y-md text-center">
                <p class="q-pt-md">
                </p>
                <p>calling...</p>
              </div>
            </div>
          </div>
          <div class="action-btns">
            <button type="button" class="btn btn-info">
              Mute
            </button>
            <button
              type="button"
              class="btn btn-primary mx-4"
            >
              Show
            </button>
            <button type="button" class="btn btn-danger">
              EndCall
            </button>
          </div>
        </div>
      </div>
      <!-- End of Placing Video Call  -->

      <!-- Incoming Call  -->
      
      <!-- End of Incoming Call  -->
    </div>
</template>

<script>
export default {

    data(){
        return{
            currentID: this.$userId, // Current Logged in user
            videoCallParams: {
                users: [], // User List Array
            }
        }
    },

    mounted() {
        this.getUserList();
    },

    methods: {

        // Get User List 
        getUserList(){
            axios.get('user-member').then(response => {
                this.videoCallParams.users = response.data;
            })
        },

        getVideo() {
            console.log(this.currentID);
        }
    }
}
</script>

<style scoped>
#video-row {
  width: 700px;
  max-width: 90vw;
}

#incoming-call-card {
  border: 1px solid #0acf83;
}

.video-container {
  width: 700px;
  height: 500px;
  max-width: 90vw;
  max-height: 50vh;
  margin: 0 auto;
  border: 1px solid #0acf83;
  position: relative;
  box-shadow: 1px 1px 11px #9e9e9e;
  background-color: #fff;
}

.video-container .user-video {
  width: 30%;
  position: absolute;
  left: 10px;
  bottom: 10px;
  border: 1px solid #fff;
  border-radius: 6px;
  z-index: 2;
}

.video-container .partner-video {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  top: 0;
  z-index: 1;
  margin: 0;
  padding: 0;
}

.video-container .action-btns {
  position: absolute;
  bottom: 20px;
  left: 50%;
  margin-left: -50px;
  z-index: 3;
  display: flex;
  flex-direction: row;
}

/* Mobiel Styles */
@media only screen and (max-width: 768px) {
  .video-container {
    height: 50vh;
  }
}
</style>