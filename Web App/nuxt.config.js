import colors from 'vuetify/es5/util/colors'

const token = Buffer.from(`${process.env.nr_username}:${process.env.nr_password}`, 'utf8').toString('base64')

export default {
  // Target: https://go.nuxtjs.dev/config-target
  target: 'static',

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    titleTemplate: '%s - A smart home devices database',
    title: 'Smarty',
    htmlAttrs: {
      lang: 'en',
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }],
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    //     https://go.nuxtjs.dev/eslint
    '@nuxtjs/eslint-module',
    // https://go.nuxtjs.dev/vuetify
    '@nuxtjs/vuetify',
    '@nuxtjs/fontawesome',
  ],
  eslint: {
    fix: true
  },
  fontawesome: {
    icons: {
      solid: true,
      brands: true,
    }
  },
  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    '@nuxtjs/axios',
  ],

  // Vuetify module configuration: https://go.nuxtjs.dev/config-vuetify
  vuetify: {
    customVariables: ['~/assets/variables.scss'],
    theme: {
      dark: false,
      themes: {
        dark: {
          primary: colors.blue.darken2,
          accent: colors.grey.darken3,
          secondary: colors.amber.darken3,
          info: colors.teal.lighten1,
          warning: colors.amber.base,
          error: colors.deepOrange.accent4,
          success: colors.green.accent3,
        },
        light: {
          primary: '#4285F4',
          secondary: '#3e4551',
          accent: '#009688',
          error: '#f44336',
          warning: '#ffeb3b',
          info: '#9c27b0',
          success: '#4caf50'
        }
      },
    },
  },
  axios: {
    // proxy: true
    baseURL: 'http://172.105.55.104:1880',
    headers: {
      'Authorization': `Basic ${token}`
    }
  },
  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
    options: {
      fix: true
    }
  },
}
