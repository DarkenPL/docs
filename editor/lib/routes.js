import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)

import Splash      from './pages/Splash.vue'
import GameManager from './pages/GameManager.vue'
import GameEditor  from './pages/GameEditor.vue'

const routes = [
  { path: '/',              component: Splash,       props: true },
  { path: '/games',         component: GameManager,  props: true },
  { path: '/games/:gameId', component: GameEditor,   props: true }
]

var router = new VueRouter({ routes })

export { router }
