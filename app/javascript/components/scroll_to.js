import Scroll from 'scroll-js/dist/scroll-min.js';

function documentScroll() {
  document.scrollTo = function(targetAnchor) {
    const targetElement = document.querySelector(targetAnchor);
    new Scroll(document.body).toElement(targetElement, {easing: 'easeInCubic', duration: 500});
  }

  const eventScroll = (event) => {
    event.preventDefault();
    const targetAnchor = event.currentTarget.attributes.href.value;
    document.scrollTo(targetAnchor);
  }

  document.querySelectorAll('.scroll-to').forEach((element) => {
    element.addEventListener('click', eventScroll);
  });
}


export { documentScroll }
