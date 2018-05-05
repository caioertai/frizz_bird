import * as skrollr from 'skrollr';

function homeSkrollr() {
  const notMobile = !(/Android|iPhone|iPad|iPod|BlackBerry/i).test(navigator.userAgent || navigator.vendor || window.opera);
  if (notMobile) {
    document.skrollrInit = skrollr.init;
    document.skrollrDestroy = skrollr.init().destroy;
  }
}

export default homeSkrollr;
