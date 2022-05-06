import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "input", "label" ]

    browse(event) {
        // Allow users to open with keyboard enter key
        if (event.keyCode == 13) {
            this.inputTarget.click()
        }
        // Click anywhere in the button that is not the text
        if (event.type == "click" && event.target != this.labelTarget) {
            this.inputTarget.click()
        }
    }
    selected() {
        // Change text on button to file name
        if (this.inputTarget.files[0]) {
            this.labelTarget.textContent = this.inputTarget.files[0].name
        }
    }
}