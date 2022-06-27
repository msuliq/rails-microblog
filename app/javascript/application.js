// Entry point for the build script in your package.json
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

import 'bootstrap'
import 'bootstrap/js/dist/dropdown'
import 'bootstrap/js/dist/collapse'

Rails.start()
Turbolinks.start()
ActiveStorage.start()