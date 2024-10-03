// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import Swiper from 'swiper';
import 'swiper/swiper-bundle.css';

document.addEventListener("turbo:load", () => {
  const swiper = new Swiper('.swiper-container', {
    // Optional parameters
    loop: true,
    autoplay: {
      delay: 2500,
      disableOnInteraction: false,
    },

    // If you need pagination
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },

    // Navigation arrows
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });
});
