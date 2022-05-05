import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    connect() {
        if (!this.isPreview) {
            // Display with transition
            setTimeout(() => {
                this.element.classList.add('transform','ease-in-out', 'duration-300', 'transition', 'opacity-0', 'scale-y-0', 'origin-top');
                this.element.classList.remove('hidden');

                // Trigger transition
                setTimeout(() => {
                    this.element.classList.remove( 'opacity-0', 'scale-y-0');
                }, 100);

            }, 100);
        }
    }

    close() {
        // Trigger transition
        setTimeout(() => {
            this.element.classList.add('opacity-0', 'scale-y-0');
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