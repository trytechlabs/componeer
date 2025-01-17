import Rails from '@rails/ujs'

Rails.start()

import { FetchRequest } from '@rails/request.js'
import '@hotwired/turbo-rails'
import Alpine from 'alpinejs'
import mask from '@alpinejs/mask'
import Componeer from 'componeer'

window.Alpine = Alpine
window.Rails = Rails
window.FetchRequest = FetchRequest
window.Componeer = Componeer

Alpine.plugin(mask)
Alpine.start()
