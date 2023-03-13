import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  submit(event) {
    event.preventDefault();
    fetch(this.formTarget.action, {
      method: 'post',
      headers: {
        "Accept": 'application/json',
        "X-CSRF-Token": document.querySelector("meta[name=csrf-param]").content
      },
      body: new FormData(this.formTarget)
    })
    .then(response => response.json())
    .then((data) => {
      this.element.innerHTML = data.html
    })
  }
}
