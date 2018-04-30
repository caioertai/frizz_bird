import Scroll from 'scroll-js/dist/scroll-min';

function documentScroll() {
  const scrollTo = (targetAnchor) => {
    const targetElement = document.querySelector(targetAnchor);
    new Scroll(document.body).toElement(targetElement, { easing: 'easeInCubic', duration: 500 });
  };
  document.scrollTo = scrollTo;

  const eventScroll = (event) => {
    event.preventDefault();
    const targetAnchor = event.currentTarget.attributes.href.value;
    document.scrollTo(targetAnchor);
  };

  document.querySelectorAll('.scroll-to').forEach((element) => {
    element.addEventListener('click', eventScroll);
  });
}

export default documentScroll;
