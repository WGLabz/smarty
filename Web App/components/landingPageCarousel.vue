<template>
  <div class="mt-0 p-0">
    <v-carousel cycle hide-delimiter-background interval="3000">
      <v-carousel-item
        src="img/image_ph.jpg"
        v-for="carouselItem in carouselItems"
        :key="carouselItem.id"
        :href="carouselItem.link"
      >
        <v-row class="fill-height" align="center" justify="center">
          <div class="display-2 white--text pl-5 pr-5 hidden-sm-only">
            <strong>{{carouselItem.text}}</strong>
          </div>
          <br />
        </v-row>
      </v-carousel-item>
    </v-carousel>
  </div>
</template>

<script>
export default {
  data() {
    return {
      carouselItems: Array,
    }
  },
  mounted() {
    this.$axios
      .get('/carousel')
      .then((res) => {
        this.carouselItems = res.data
      })
      .catch((error) => {
        console.log('Error fetching carousel items. Err ' + error)
      })
  },
}
</script>