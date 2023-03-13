import { Controller } from "@hotwired/stimulus"
import Swiper, { Navigation, Pagination } from 'swiper';


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
      modules: [Navigation, Pagination],

        // If we need pagination
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
      },

      // Navigation arrows
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  }
}
