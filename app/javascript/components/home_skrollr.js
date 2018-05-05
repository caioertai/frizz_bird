import * as skrollr from 'skrollr';

function homeSkrollr() {
  document.skrollrInit = skrollr.init;
  document.skrollrDestroy = skrollr.init().destroy;
}

export default homeSkrollr;
