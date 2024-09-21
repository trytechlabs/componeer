import Rails from '@rails/ujs'

Rails.start()

import { FetchRequest } from '@rails/request.js'
import '@hotwired/turbo-rails'
import Alpine from 'alpinejs'
import Componeer from '@trytechlabs/componeer'

require('inputmask/dist/inputmask')

// Internal depencencies

window.Alpine = Alpine
window.Rails = Rails
window.FetchRequest = FetchRequest
window.Componeer = Componeer

Alpine.start()
