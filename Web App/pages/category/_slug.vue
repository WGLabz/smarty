<template>
  <div>
    <v-container>
      <div class="row">
        <div class="col-md-3 col-sm-3 col-xs-12">
          <v-card outlined>
            <v-card-title>Filters</v-card-title>
            <v-divider />
            <template>
              <v-treeview
                :items="items"
                :open="[1]"
                :active="[5]"
                :selected-color="'#fff'"
                activatable
                open-on-click
                dense
              />
            </template>
            <v-divider />
            <v-card-title>Price</v-card-title>
            <v-range-slider
              v-model="range"
              :max="max"
              :min="min"
              :height="10"
              class="align-center"
              dense
            />
            <v-row class="pa-2" dense>
              <v-col cols="12" sm="5">
                <v-text-field
                  :value="range[0]"
                  label="Min"
                  outlined
                  dense
                  @change="$set(range, 0, $event)"
                />
              </v-col>
              <v-col cols="12" sm="2">
                <p class="pt-2 text-center">
                  TO
                </p>
              </v-col>
              <v-col cols="12" sm="5">
                <v-text-field
                  :value="range[1]"
                  label="Max"
                  outlined
                  dense
                  @change="$set(range, 1, $event)"
                />
              </v-col>
            </v-row>
            <v-divider />
            <v-card-title class="pb-0">
              Customer Rating
            </v-card-title>
            <v-container class="pt-0" fluid>
              <v-checkbox
                append-icon="mdi-star"
                label="4 & above"
                hide-details
                dense
              />
              <v-checkbox
                append-icon="mdi-star"
                label="3 & above"
                hide-details
                dense
              />
              <v-checkbox
                append-icon="mdi-star"
                label="2 & above"
                hide-details
                dense
              />
              <v-checkbox
                append-icon="mdi-star"
                label="1 & above"
                hide-details
                dense
              />
            </v-container>
            <v-divider />
            <v-card-title class="pb-0">
              Size
            </v-card-title>
            <v-container class="pt-0" fluid>
              <v-checkbox label="XS" hide-details dense />
              <v-checkbox label="S" hide-details dense />
              <v-checkbox label="M" hide-details dense />
              <v-checkbox label="L" hide-details dense />
              <v-checkbox label="XL" hide-details dense />
              <v-checkbox label="XXL" hide-details dense />
              <v-checkbox label="XXXL" hide-details dense />
            </v-container>
          </v-card>
        </div>
        <div class="col-md-9 col-sm-9 col-xs-12">
          <v-breadcrumbs class="pb-0" :items="breadcrums" />
          <v-row dense>
            <v-col cols="12" sm="8" class="pl-6 pt-6">
              <small>Showing {{ (page - 1) * pageSize }}-{{ page * pageSize }} of
                {{ totalProducts }} products</small>
            </v-col>
            <v-col cols="12" sm="4">
              <v-select
                v-model="select"
                class="pa-0"
                :items="options"
                style="margin-bottom: -20px"
                outlined
                dense
              />
            </v-col>
          </v-row>

          <v-divider class="pb-2" />

          <div class="row text-center">
            <div
              v-for="product in products"
              :key="product.id"
              class="col-md-3 col-sm-6 col-xs-12"
            >
              <v-hover v-slot="{ hover }">
                <v-card class="mx-auto" color="grey lighten-4" max-width="600">
                  <v-img
                    class="white--text align-end"
                    :aspect-ratio="16 / 9"
                    height="200px"
                    :src="`${$axios.defaults.baseURL}/thumbnails/${product.image}`"
                    lazy-src="img/image_ph.jpg"
                  >
                    <v-card-title>{{ product.type }}</v-card-title>
                    <v-expand-transition>
                      <div
                        v-if="hover"
                        class="
                          d-flex
                          transition-fast-in-fast-out
                          white
                          darken-2
                          v-card--reveal
                          display-3
                          white--text
                        "
                        style="height: 100%"
                      >
                        <v-btn
                          v-if="hover"
                          :href="`/product/${product.slug}`"
                          class
                          outlined
                        >
                          VIEW
                        </v-btn>
                      </div>
                    </v-expand-transition>
                  </v-img>
                  <v-card-text class="text--primary">
                    <div>
                      <a
                        :href="`/product/${product.slug}`"
                        style="text-decoration: none"
                      >{{ product.name }}</a>
                    </div>
                    <div>$ {{ product.price }}</div>
                  </v-card-text>
                </v-card>
              </v-hover>
            </div>
          </div>
          <div v-if="totalProducts > pageSize" class="text-center mt-12">
            <v-pagination
              v-model="page"
              :length="paginationTabs"
              @next="getProducts()"
              @previous="getProducts()"
              @input="getProducts()"
            />
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
    paginationTabs: 0,
    pageSize: 12,
    totalProducts: 0,
    range: [0, 10000],
    select: 'Popularity',
    options: [
      'Default',
      'Popularity',
      'Relevance',
      'Price: Low to High',
      'Price: High to Low'
    ],
    page: 1,
    breadcrums: [],
    min: 0,
    max: 10000,
    items: [
      {
        id: 2,
        name: 'Shoes',
        children: [
          { id: 2, name: 'Casuals' },
          { id: 3, name: 'Formals' },
          { id: 4, name: 'Sneakers' }
        ]
      },
      {
        id: 1,
        name: 'Clothing',
        children: [
          { id: 5, name: 'Shirts' },
          { id: 6, name: 'Tops' },
          { id: 7, name: 'Tunics' },
          { id: 8, name: 'Bodysuit' }
        ]
      }
    ],
    products: Array
  }),
  mounted () {
    this.getProductCatgoryMetaData()
    this.getProducts()
  },
  methods: {
    getProductCatgoryMetaData () {
      const category = this.$route.params.slug
      this.$axios
        .get(`/categories/meta?cat=${category}`)
        .then((res) => {
          this.breadcrums = res.data.breadcrums
        })
        .catch((error) => {
          console.log('Category Module. Error', error)
        })
    },
    getProducts () {
      const category = this.$route.params.slug
      this.$axios
        .get('/products/category', {
          params: {
            cat: category,
            page: this.page,
            pagesize: this.pageSize
          }
        })
        .then((res) => {
          this.products = res.data.products
          this.totalProducts = res.data.total
          this.paginationTabs = this.totalProducts / this.pageSize
        })
        .catch((error) => {
          console.log('Category Module. Error', error)
        })
    }
  }
}
</script>
