import 'skrollr';

function homeSkrollr() {
  const landing = document.getElementById('landing');
  if (landing) {
    require(['skrollr'], (skrollr) => {
      const s = skrollr.init();
    });
  }
}

export default homeSkrollr;
