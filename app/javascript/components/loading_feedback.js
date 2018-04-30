function loadingFeedback() {
  const productSearch = document.getElementById('product-search');
  const landing = document.getElementById('landing');

  const submitTrigger = () => {
    productSearch.setAttribute('disabled', '');
    landing.classList.add('loading');
  };
  productSearch.addEventListener('submit', submitTrigger);
}

export default loadingFeedback;
