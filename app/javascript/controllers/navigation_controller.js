import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "mobileMenu", "open", "close" ]

    open(event) {
        if (!this.clicked_or_enter(event)) { return }

        // Toggle buttons
        this.openTarget.classList.add('hidden')
        this.closeTarget.classList.remove('hidden')

        // Display menu with transition
        setTimeout(() => {
            this.mobileMenuTarget.classList.remove('hidden');
            this.mobileMenuTarget.classList.add('transform', 'ease-out', 'duration-300', 'transition', '-translate-y-2', 'opacity-0');
            this.closeTarget.focus()

            // Trigger transition
            setTimeout(() => {
                this.mobileMenuTarget.classList.add('-translate-y-0', 'opacity-100');
            }, 100);
        }, 50);
    }

    close(event) {
        if (!this.clicked_or_enter(event)) { return }

        // Toggle buttons
        this.closeTarget.classList.add('hidden')
        this.openTarget.classList.remove('hidden')

        // Remove menu with transition
        this.mobileMenuTarget.classList.remove( 'opacity-100', '-translate-y-0');

        // Trigger transition
        setTimeout(() => {
            this.mobileMenuTarget.classList.add('opacity-0', '-translate-y-2');
            this.openTarget.focus()
            // Hide element after transition
            setTimeout(() => {
                this.mobileMenuTarget.classList.add('hidden');
            }, 100);
        }, 50);
    }

    clicked_or_enter(event) {
        return event.type === "click" || event.keyCode === 13
    }
}