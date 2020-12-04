import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const bannerText = document.querySelector('#banner-text')
  if (bannerText) {
  new Typed('#banner-text', {
    strings: ["", "Easy.  Fast.  Cheap."],
    typeSpeed: 150,
    loop: true
  });
  }
}

export { loadDynamicBannerText };
