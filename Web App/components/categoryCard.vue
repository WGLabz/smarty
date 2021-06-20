<template>
  <v-card outlined>
    <v-img
      :src="`${$axios.defaults.baseURL}/thumbnail?name=${categoryDetails.image}`"
      class="white--text align-center"
      gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.4)"
      :height="height"
      lazy-src="img/image_ph.jpg"
    >
      <h1 class="text-center font-size">{{categoryDetails.name}}</h1>
      <div class="text-center mt-2">
        <v-btn class="white--text caption" href="/shop" text>
          Explore
          <v-icon class="white--text caption">mdi-arrow-right</v-icon>
        </v-btn>
      </div>
    </v-img>
  </v-card>
</template>

<script>
export default {
  props: {
    categoryDetails: Object,
    height: String,
  },
}
</script>