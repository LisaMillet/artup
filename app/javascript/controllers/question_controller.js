import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "answersContainer", "gif", "yesSound", "noSound"]
  static values = {
    yesGifUrl: String,
    noGifUrl: String,
  }

  connect() {
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
      if (data.answer_is_right) {
        this.answersContainerTarget.innerHTML = `<div class="gif-container" data-question-target="gif"><img src="${this.yesGifUrlValue}"><div><span>💖</span><div class="mx-2"> Oh yeaaaaaah!!! </div><span>💖</span></div></div>`
        this.yesSoundTarget.play();
      } else {
        this.answersContainerTarget.innerHTML = `<div class="gif-container" data-question-target="gif"><img src="${this.noGifUrlValue}"><div><span>⛔️</span><div class="mx-2"> No No No No!!! </div><span>⛔️</span></div></div>`
        this.noSoundTarget.play();
      }
      setTimeout(() => {
        this.gifTarget.classList.add('appear');
      }, 5)
      setTimeout(() => {
        this.element.innerHTML = data.html
      }, 2000)
    })
  }
}
