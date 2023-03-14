import { Controller } from "@hotwired/stimulus"
import Swiper, { EffectCoverflow } from 'swiper';


export default class extends Controller {
  connect() {
    const swiper = new Swiper(this.element, {
      effect: 'coverflow',
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: "auto",
      coverflowEffect: {
        rotate: 30,
        slideShadows: true,
        stretch: 0,
        depth: 100,
      },
      modules: [EffectCoverflow]
    });
  }
}
