import Scroll from 'scroll-js/dist/scroll-min.js';

function setScrollTo() {
  const eventScroll = (event) => {
    event.preventDefault();
    const targetAnchor = event.currentTarget.attributes.href.value;
    const myElement = document.querySelector(targetAnchor);
    new Scroll(document.body).toElement(myElement, {easing: 'easeInCubic', duration: 500});
  }

  document.querySelectorAll('.scroll-to').forEach((element) => {
    element.addEventListener('click', eventScroll);
  });
};


export { setScrollTo }
