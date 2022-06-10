import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "hideable" ]

    connect() {
        console.log("stimulus", this.element)
    }

    showHide() {
        this.hideableTargets.forEach((el) => {
            if (el.classList.contains("hide")) {
                el.classList.remove("hide");
                el.classList.add("show");
            } else {
                el.classList.remove("show");
                el.classList.add("hide");
            }
            console.log(el.hidden, el)
        });
    }
}