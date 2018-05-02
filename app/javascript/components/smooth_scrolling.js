import SmoothScroll from 'smooth-scroll/dist/js/smooth-scroll.min';

function smoothScroll() {
  document.smoothScrollAnchors = new SmoothScroll('a[href*="#"]');
  document.smoothScrollTo = new SmoothScroll().animateScroll;
}

export default smoothScroll;
