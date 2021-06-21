<template>
  <div>
    <v-container>
      <div class="row mb-12">
        <div class="col">
          <div class="row text-center">
            <div
              class="col-md-3 col-sm-6 col-xs-12"
              :key="category.id"
              v-for="category in categories"
            >
              <v-hover v-slot:default="{ hover }">
                <v-card class="mx-auto" color="grey lighten-4" max-width="600">
                  <v-img
                    class="white--text align-end"
                    :aspect-ratio="16/9"
                    height="200px"
                    :src="`${$axios.defaults.baseURL}/thumbnails/${category.image}`"
                  >
                    <v-card-title>{{category.name}}</v-card-title>
                    <v-expand-transition>
                      <div
                        v-if="hover"
                        class="d-flex transition-fast-in-fast-out white darken-2 v-card--reveal display-3 white--text"
                        style="height: 100%;"
                      >
                        <v-btn
                          v-if="hover"
                          :href="`/category/${category.slug}`"
                          class
                          outlined
                          nuxt
                        >Explore</v-btn>
                      </div>
                    </v-expand-transition>
                  </v-img>
                  <v-card-text class="text--primary">
                    <div>
                      <a href="/category" style="text-decoration: none">{{category.name}}</a>
                    </div>
                    <div>{{category.text2}}</div>
                  </v-card-text>
                </v-card>
              </v-hover>
            </div>
          </div>
        </div>
      </div>
    </v-container>
  </div>
</template>
<style>
.v-card--reveal {
  align-items: center;
  bottom: 0;
  justify-content: center;
  opacity: 0.8;
  position: absolute;
  width: 100%;
}
</style>
<script>
export default {
  data: () => ({
    categories: Array,
  }),
  mounted() {
    this.$axios
      .get('/categories/all')
      .then((res) => {
        this.categories = res.data
      })
      .catch((error) => {
        console.error('Error in fetching all categories Err' + error)
      })
  },
}
</script>