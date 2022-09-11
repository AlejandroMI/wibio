import { Application } from "@hotwired/stimulus"
import Dropdown from 'stimulus-dropdown'
import Sortable from 'stimulus-sortable'

const application = Application.start()
application.register('dropdown', Dropdown)
application.register('sortable', Sortable)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
