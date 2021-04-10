import Vue from 'vue'
import App from './App'
import './styles/base.css'
import "./styles/iconfont.css"


// Vue.config.productionTip = false

//工具类
import utils from './utils/utils.js'
Vue.prototype.$u = utils
import api from './pages/api/index.js'
Vue.prototype.$api = api

//全局设定api
// import * as page from '@/pages/api'
// Vue.prototype.$page = page.default

App.mpType = 'app'

const app = new Vue({
    ...App
})
app.$mount()

