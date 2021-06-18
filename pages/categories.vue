<template>
  <div>
    <v-container>
      <div class="row mb-12">
        <div class="col">
          <div class="row text-center">
            <div class="col-md-3 col-sm-6 col-xs-12" :key="pro.id" v-for="pro in products">
              <v-hover v-slot:default="{ hover }">
                <v-card class="mx-auto" color="grey lighten-4" max-width="600">
                  <v-img
                    class="white--text align-end"
                    :aspect-ratio="16/9"
                    height="200px"
                    :src="pro.src"
                  >
                    <v-card-title>{{pro.type}}</v-card-title>
                    <v-expand-transition>
                      <div
                        v-if="hover"
                        class="d-flex transition-fast-in-fast-out white darken-2 v-card--reveal display-3 white--text"
                        style="height: 100%;"
                      >
                        <v-btn v-if="hover" href="/product" class outlined>VIEW</v-btn>
                      </div>
                    </v-expand-transition>
                  </v-img>
                  <v-card-text class="text--primary">
                    <div>
                      <a href="/product" style="text-decoration: none">{{pro.name}}</a>
                    </div>
                    <div>${{pro.price}}</div>
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
    range: [0, 10000],
    select: 'Popularity',
    options: [
      'Default',
      'Popularity',
      'Relevance',
      'Price: Low to High',
      'Price: High to Low',
    ],
    page: 1,
    breadcrums: [
      {
        text: 'Home',
        disabled: false,
        href: 'breadcrumbs_home',
      },
      {
        text: 'Clothing',
        disabled: false,
        href: 'breadcrumbs_clothing',
      },
      {
        text: 'T-Shirts',
        disabled: true,
        href: 'breadcrumbs_shirts',
      },
    ],
    min: 0,
    max: 10000,
    items: [
      {
        id: 2,
        name: 'Shoes',
        children: [
          { id: 2, name: 'Casuals' },
          { id: 3, name: 'Formals' },
          { id: 4, name: 'Sneakers' },
        ],
      },
      {
        id: 1,
        name: 'Clothing',
        children: [
          { id: 5, name: 'Shirts' },
          { id: 6, name: 'Tops' },
          { id: 7, name: 'Tunics' },
          { id: 8, name: 'Bodysuit' },
        ],
      },
    ],
    products: [
      {
        id: 1,
        name: 'BLACK TEE',
        type: 'Jackets',
        price: '18.00',
        src: 'assets/img/image_ph.jpg',
      },
      {
        id: 2,
        name: 'WHITE TEE',
        type: 'Polo',
        price: '40.00',
        src: 'assets/img/image_ph.jpg',
      },
      {
        id: 3,
        name: 'Zara limited...',
        type: 'Denim',
        price: '25.00',
        src: 'assets/img/image_ph.jpg',
      },
      {
        id: 4,
        name: 'SKULL TEE',
        type: 'Jackets',
        price: '30.00',
        src: 'assets/img/image_ph.jpg',
      },
      {
        id: 5,
        name: 'MANGO WINTER',
        type: 'Sweaters',
        price: '50.00',
        src: 'assets/img/image_ph.jpg',
      },
      {
        id: 6,
        name: 'SHIRT',
        type: 'Denim',
        price: '34.00',
        src: 'assets/img/image_ph.jpg',
      },
      {
        id: 7,
        name: 'TRUCKER JACKET',
        type: 'Jackets',
        price: '38.00',
        src: 'assets/img/image_ph.jpg',
      },
      {
        id: 8,
        name: 'COATS',
        type: 'Jackets',
        price: '25.00',
        src: 'assets/img/image_ph.jpg',
      },
      {
        id: 9,
        name: 'MANGO WINTER',
        type: 'Sweaters',
        price: '50.00',
        src: 'assets/img/image_ph.jpg',
      },
      {
        id: 10,
        name: 'SHIRT',
        type: 'Denim',
        price: '34.00',
        src: 'assets/img/image_ph.jpg',
      },
      {
        id: 11,
        name: 'TRUCKER JACKET',
        type: 'Jackets',
        price: '38.00',
        src: 'assets/img/image_ph.jpg',
      },
      {
        id: 12,
        name: 'COATS',
        type: 'Jackets',
        price: '25.00',
        src: 'assets/img/image_ph.jpg',
      },
    ],
  }),
}
</script>