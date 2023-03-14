import { Controller } from "@hotwired/stimulus"
import Swiper, { EffectCoverflow } from 'swiper';


export default class extends Controller {
  static targets = ['slide']
  static values = {
    nextPieceId: Number
  }

  get nextPieceSlideIndex() {
    const nextPieceSlide = this.slideTargets.find(slide => slide.dataset.pieceId == this.nextPieceIdValue);
    return this.slideTargets.findIndex(slide => slide == nextPieceSlide)
  }

  connect() {
    this.element.controller = this;

    this.swiper = new Swiper(this.element, {
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

    this.swiper.slideTo(this.nextPieceSlideIndex, 1000)
  }
}
