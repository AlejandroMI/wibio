import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "input", "label" ]

    connect() {
        console.log("Connected file button")
    }
    browse(event) {
        if (event.keyCode == 13) {
            this.inputTarget.click()
        }
    }
    selected() {
        if (this.inputTarget.files[0]) {
            this.labelTarget.textContent = this.inputTarget.files[0].name
        }
    }
}