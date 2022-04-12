import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    connect() {
        if (!this.isPreview) {
            // Display with transition
            setTimeout(() => {
                this.element.classList.remove('hidden');
                this.element.classList.add('transform', 'ease-out', 'duration-300', 'transition', '-translate-y-2', 'opacity-0');

                // Trigger transition
                setTimeout(() => {
                    this.element.classList.add('-translate-y-0', 'opacity-100');
                }, 100);

            }, 100);

            // Auto-hide
            setTimeout(() => {
                this.close();
            }, 8000);
        }
    }

    close() {
        // Remove with transition
        this.element.classList.remove( 'opacity-100', '-translate-y-0');

        // Trigger transition
        setTimeout(() => {
            this.element.classList.add('opacity-0', '-translate-y-2');
        }, 300);

        // Remove element after transition
        setTimeout(() => {
            this.element.remove();
        }, 300);
    }


    // A neat trick for Turbolinks to prevent rendering it when you going back.
    get isPreview() {
        return document.documentElement.hasAttribute('data-turbolinks-preview')
    }
}