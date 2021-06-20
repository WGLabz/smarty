<template>
  <v-hover v-slot:default="{ hover }" open-delay="200">
    <v-card :elevation="hover ? 16 : 2">
      <v-img
        class="white--text align-end"
        height="200px"
        :src="`${$axios.defaults.baseURL}/thumbnail?name=${productDetails.image}`"
        lazy-src="img/image_ph.jpg"
      >
        <v-card-title>{{productDetails.name}}</v-card-title>
      </v-img>

      <v-card-text class="text--primary text-center">
        <div>Upto 60% + Extra 10%</div>
        <div>Baggit, Zara, Fossil</div>
      </v-card-text>
      <div class="text-center">
        <v-btn href="/shop" class="ma-2" outlined color="info">Check Now</v-btn>
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

<style>
</style>