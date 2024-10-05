// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";

document.addEventListener("turbo:load", function() {
  const mainSwiperContainer = document.querySelector('.main-swiper');
  const thumbSwiperContainer = document.querySelector('.thumb-swiper');

    // 画像がすべて読み込まれたかをチェックする関数
    function checkImagesLoaded(images, callback) {
      let loadedImages = 0;
      images.forEach((img) => {
        if (img.complete) {  // すでに画像がキャッシュされている場合
          loadedImages++;
        } else {
          img.onload = () => {
            loadedImages++;
            if (loadedImages === images.length) {
              callback();
            }
          };
          img.onerror = () => {
            loadedImages++;
            if (loadedImages === images.length) {
              callback();
            }
          };
        }
      });
  
      // すべての画像がすでに読み込まれていた場合に即座にcallbackを呼ぶ
      if (loadedImages === images.length) {
        callback();
      }
    }
    
  const thumbSwiperOptions = {
    slidesPerView: 'auto',
    spaceBetween: 10,
    slideToClickedSlide: true,
    loop: false,
  };

  const thumbSwiper = new Swiper(thumbSwiperContainer, thumbSwiperOptions);

  const mainSwiperOptions = {
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
    thumbs: {
      swiper: thumbSwiper,
    },
  };

  const mainSwiper = new Swiper(mainSwiperContainer, mainSwiperOptions);
});
