import { Controller } from "@hotwired/stimulus"
import {marked} from 'marked';
import DOMPurify from 'dompurify';

// Connects to data-controller="proj"
export default class extends Controller {
  initialize() {
    this.desc = this.element.dataset.desc
  }
  connect() {
    if (this.element.lastElementChild != null) {
      if (this.element.lastElementChild.classList.contains("desc")) {
        return
      }
    }
    let elem = document.createElement("p")
    elem.innerHTML = DOMPurify.sanitize(marked.parse(this.desc))
    elem.classList.add("desc")
    this.element.appendChild(elem)
  }
}
