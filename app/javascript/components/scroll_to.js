import Scroll from 'scroll-js/dist/scroll-min.js';

function setScrollTo() {
  const eventScroll = (event) => {
    event.preventDefault();
    var targetAnchor = event.currentTarget.attributes.href.value;
    var myElement = document.querySelector(targetAnchor);
    new Scroll(document.body).toElement(myElement, {easing: 'easeInCubic', duration: 500});
  }

  document.querySelectorAll('.scroll-to').forEach((element) => {
    element.addEventListener('click', eventScroll);
  });
};


export { setScrollTo }
