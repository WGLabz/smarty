<template>
  <div>
    <!-- Main Carousel -->
    <landing-page-carousel />
    <!-- Show category of Products -->
    <div class="pl-4 pr-4 row m-0 mt-4">
      <div
        :class="index < 2 ? `col-md-6 col-sm-6 col-xs-12`: `col-md-4 col-sm-4 col-xs-12`"
        v-for="(category ,index) in categories"
        :key="category.id"
      >
        <category-card :categoryDetails="category" :height="index < 2 ? `400px` : `300px`" />
      </div>
    </div>
    <!-- Show products added recently -->
    <v-container>
      <v-row no-gutters>
        <v-col :cols="12">
          <v-card-text class tile outlined>
            <v-card-title class="subheading">Latest Additions</v-card-title>
            <v-divider></v-divider>
            <div class="row mt-2">
              <div
                class="col-12 col-md-3 col-sm-6 col-xs-6 text-center"
                v-for="product in latestProducts"
                :key="product.id"
              >
                <latest-product-card :productDetails="product" />
              </div>
            </div>
          </v-card-text>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import latestProductCard from '../components/latestProductCard.vue'
export default {
  components: { latestProductCard },
  data() {
    return {
      categories: Array,
      latestProducts: Array,
    }
  },
  mounted() {
    this.$axios
      .get('/categories')
      .then((res) => {
        this.categories = res.data
      })
      .catch((err) => {
        console.log('Error in fetching catgory details for homepage! ERR' + err)
      })
    this.$axios
      .get('/products/latest')
      .then((res) => {
        this.latestProducts = res.data
      })
      .catch((err) => {
        console.log(
          'Error in fetching latest product details for homepage! ERR' + err
        )
      })
  },
}
</script>
