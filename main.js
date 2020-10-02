import Vue from 'vue'
import App from './App'
import utils from './utils/utils.js'

Vue.config.productionTip = false
Vue.prototype.$u = utils

App.mpType = 'app'

const app = new Vue({
    ...App
})
app.$mount()