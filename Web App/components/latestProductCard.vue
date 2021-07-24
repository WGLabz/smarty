<template>
  <v-hover v-slot:default="{ hover }" open-delay="200">
    <v-card :elevation="hover ? 16 : 2">
      <v-img
        class="white--text align-end"
        height="200px"
        gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.2)"
        :src="`${$axios.defaults.baseURL}/thumbnails/${productDetails.image}`"
        lazy-src="img/image_ph.jpg"
      >
        <v-card-title>{{productDetails.name}}</v-card-title>
      </v-img>

      <v-card-text class="text--primary text-center">
        <div>{{productDetails.text1}}</div>
        <div>{{productDetails.text2}}</div>
      </v-card-text>
      <div class="text-center">
        <v-btn
          :to="{ path: `/product/${productDetails.slug}`}"
          class="ma-2"
          outlined
          color="info"
          nuxt
        >Check Now</v-btn>
      </div>
    </v-card>
  </v-hover>
</template>

<script>
export default {
  props: {
    productDetails: Object,
  },
}
</script>