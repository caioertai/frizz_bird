// app/javascript/components/home_parallax.js

import Parallax from 'parallax-js/dist/parallax.min.js';


function loadParallax() {
  var scene = document.getElementById('main');
  var parallaxInstance = new Parallax(scene);
  console.log('loaded');
  
}

export { loadParallax };
