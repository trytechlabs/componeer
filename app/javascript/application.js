import Rails from '@rails/ujs'

Rails.start()

import { FetchRequest } from '@rails/request.js'
import '@hotwired/turbo-rails'
import Alpine from 'alpinejs'

require('inputmask/dist/inputmask')

// Internal depencencies

window.Alpine = Alpine
window.Rails = Rails
window.FetchRequest = FetchRequest

Alpine.start()
