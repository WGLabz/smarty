<template>
  <v-app>
    <v-toolbar color="primary" dark>
      <v-toolbar-title style="width: 350px" v-text="title" />
      <v-text-field
        solo-inverted
        flat
        dense
        hide-details
        prepend-inner-icon="mdi-magnify"
        background-color="white"
        label="Search"
        class="hidden-sm-and-down text--black"
      ></v-text-field>
      <v-spacer></v-spacer>
      <v-btn color="primary" to="/" nuxt small depressed class="ma-2">
        <v-icon left>mdi-home</v-icon>Home
      </v-btn>
      <v-menu offset-y open-on-hover>
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="primary"
            to="/categories"
            nuxt
            small
            elevation="0"
            class="ma-2"
            v-bind="attrs"
            v-on="on"
          >
            <v-icon left>mdi-format-list-text</v-icon>Categories
          </v-btn>
        </template>
        <v-list dense max-width="400px" nav>
          <v-btn-toggle v-for="(category, index) in categories" :key="index" group dense>
            <v-btn
              color="white"
              :to="`/category/${category.slug}`"
              nuxt
              small
              depressed
              class="black--text"
              min-width="120px"
              max-width="120px"
            >
              <v-icon dense left>{{category.mdi_icon}}</v-icon>
              {{category.name}}
            </v-btn>
          </v-btn-toggle>
        </v-list>
      </v-menu>
      <v-btn color="primary" to="/about-us" nuxt small depressed class="ma-2">
        <v-icon left>mdi-account-group</v-icon>About Us
      </v-btn>
    </v-toolbar>
    <!-- <v-app-bar :clipped-left="clipped" fixed app color="primary" dark>
      <v-toolbar-title style="width: 350px" v-text="title" />
      <v-text-field
        light
        solo-inverted
        flat
        hide-details
        prepend-inner-icon="mdi-magnify"
        label="Search"
        class="hidden-sm-and-down pl-10 ml-4"
      ></v-text-field>

      <v-spacer />
     <v-toolbar-items>
        <v-btn :to="{name: 'home'}" flat exact>Home</v-btn>
        <v-btn :to="{name: 'second-page'}" flat>Second Page</v-btn>

        <v-menu offset-y>
          <template v-slot:activator="{ on }">
            <v-btn color="primary" dark v-on="on">Dropdown</v-btn>
          </template>
          <v-list>
            <v-list-tile>
              <v-list-tile-title>Item 1</v-list-tile-title>
            </v-list-tile>
            <v-list-tile>
              <v-list-tile-title>Item 2</v-list-tile-title>
            </v-list-tile>
          </v-list>
        </v-menu>
      </v-toolbar-items>
    </v-app-bar>-->
    <v-main>
      <v-bottom-navigation value="activeBtn" color="#033" horizontal>
        <!-- <v-btn href="/" nuxt>
          <span>Home</span>
        </v-btn>
        <v-menu open-on-hover offset-y>
          <template v-slot:activator="{ on }">
            <v-btn v-on="on" href="/categories" nuxt>
              <span>Categories</span>
            </v-btn>
          </template>
          <v-card class="mx-auto" max-width="344" outlined>
            <v-list-item
              v-for="(item, index) in categories"
              :key="index"
              router
              :to="`/category/${item.slug}`"
            >
              <v-list-item-action>
                <v-list-item-title>{{ item.name }}</v-list-item-title>
              </v-list-item-action>
            </v-list-item>
          </v-card>
        </v-menu>
        <v-btn href="https://wglabz.in" target="_blank">
          <span>Blog</span>
        </v-btn>-->
      </v-bottom-navigation>
    </v-main>
    <v-main class="container_">
      <nuxt />
    </v-main>
    <v-footer :padless="true">
      <v-card flat tile width="100%" class="secondary white--text text-center custom-color">
        <v-card-text>
          <v-btn class="mx-4 white--text" icon>
            <a href="https://www.facebook.com/wglabz" target="_blank">
              <font-awesome-icon :icon="['fab', 'facebook']" />
            </a>
          </v-btn>
          <v-btn class="mx-4 white--text" icon>
            <a href="https://www.linkedin.com/company/wglabz/" target="_blank">
              <font-awesome-icon :icon="['fab', 'linkedin']" />
            </a>
          </v-btn>
          <v-btn class="mx-4 white--text" icon>
            <a href="https://www.twitter.com/wglabz/" target="_blank">
              <font-awesome-icon :icon="['fab', 'twitter']" />
            </a>
          </v-btn>
          <v-btn class="mx-4 white--text" icon>
            <a href="https://www.youtube.com/wglabz" target="_blank">
              <font-awesome-icon :icon="['fab', 'youtube']" />
            </a>
          </v-btn>
          <v-btn class="mx-4 white--text" icon>
            <a href="https://www.instagram.com/wglabz/" target="_blank">
              <font-awesome-icon :icon="['fab', 'instagram']" />
            </a>
          </v-btn>
        </v-card-text>
        <v-divider></v-divider>
        <v-card-text class="white--text">
          <v-row>
            <v-col lg="6">
              <v-card flat tile class="secondary white--text text-center">
                <v-card-title>Smarty</v-card-title>
                <v-card-text class="white--text text-justify">
                  <hr class="blue mb-4 mt-0 d-inline-block mx-auto" style="width: 100px;" />
                  <p>All the information on this website is published in good faith and for general information purpose only. SBCFinder does not make any warranties about the completeness, reliability and accuracy of this information. Any action you take upon the information you find on this website is strictly at your own risk. SBCFinder will not be liable for any losses and/or damages in connection with the use of our website. All the specifications of the mentioned SBCs are as per official sources or third party public websites.</p>
                </v-card-text>
              </v-card>
            </v-col>
            <v-col lg="3">
              <v-card flat tile class="secondary white--text text-center">
                <v-card-title>Links</v-card-title>
                <v-card-text class="white--text text-left">
                  <hr class="blue mb-4 mt-0 d-inline-block mx-auto" style="width: 100px;" />
                  <p>
                    <a href="http://www.youtube.com/weargenius">
                      <font-awesome-icon :icon="['fab', 'youtube']" class="mr-2" />YouTube Channel
                    </a>
                  </p>
                  <p>
                    <a href="http://weargenius.in">
                      <font-awesome-icon :icon="['fab', 'wordpress-simple']" class="mr-2" />Blog
                    </a>
                  </p>
                  <p>
                    <font-awesome-icon :icon="['fas', 'chart-bar']" class="mr-2" />Page Views:
                  </p>
                </v-card-text>
              </v-card>
            </v-col>
            <v-col lg="3">
              <v-card flat tile class="white--text secondary">
                <v-card-title>Contact</v-card-title>
                <v-card-text class="white--text text-left">
                  <hr class="blue mb-4 mt-0 d-inline-block mx-auto" style="width: 100px;" />
                  <p>
                    <font-awesome-icon :icon="['fas', 'map-marker-alt']" class="mr-2" />Bengaluru,560043, INDIA
                  </p>
                  <p>
                    <font-awesome-icon :icon="['fas', 'envelope']" class="mr-2" />weargeniuslabs@gmail.com
                  </p>
                  <p>
                    <font-awesome-icon :icon="['fas', 'phone-alt']" class="mr-2" />+91 **********
                  </p>
                </v-card-text>
              </v-card>
            </v-col>
          </v-row>
        </v-card-text>
        <v-divider></v-divider>
        <v-card-text class="white--text">
          {{ new Date().getFullYear() }} —
          <strong>
            <a href="https://wglabz.in" target="blank_">WGLabz</a>
          </strong>
        </v-card-text>
      </v-card>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      clipped: false,
      drawer: false,
      fixed: false,
      activeBtn: 1,
      items: [
        {
          icon: 'mdi-apps',
          title: 'Welcome',
          to: '/',
        },
        {
          icon: 'mdi-chart-bubble',
          title: 'Inspire',
          to: '/inspire',
        },
      ],
      miniVariant: false,
      title: 'Smarty',
      categories: Array,
    }
  },
  mounted() {
    this.$axios
      .get('/categories/all')
      .then((res) => {
        this.categories = res.data
      })
      .catch((err) => {
        console.log('Error in fetching catgory details for homepage! ERR' + err)
      })
  },
}
</script>
<style scoped>
a:link,
a:visited {
  color: white;
  text-decoration: none;
}
.container_ {
  padding: 0 0 0 0 !important;
}
.theme--dark.v-btn--active::before {
  opacity: 0 !important;
}
.btn-toggle {
  flex-direction: column;
}
.hidden-sm-and-down .v-icon {
    color: black !important;
}
</style>>
