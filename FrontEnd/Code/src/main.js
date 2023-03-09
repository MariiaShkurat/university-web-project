import { createApp } from 'vue'
import App from './App.vue'
import router from './router'

import './assets/main.css'

const app = createApp(App)

app.use(router)

/* import the fontawesome core */
import { library } from '@fortawesome/fontawesome-svg-core'

/* import font awesome icon component */
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

/* import specific icons */
import { faPaperPlane, faUserSecret } from '@fortawesome/free-solid-svg-icons'
import { faLinkedin, faTwitter, faYoutube } from '@fortawesome/free-brands-svg-icons'

/* add icons to the library */
library.add(faUserSecret, faPaperPlane, faTwitter, faYoutube, faLinkedin)

app.component('font-awesome-icon', FontAwesomeIcon).mount('#app')
