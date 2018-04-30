function loadingFeedback() {
  const productSearch = document.getElementById('product-search');
  const landing = document.getElementById('landing');

  // Adds loading function to document
  const setMainLoading = (state) => {
    if (state) {
      productSearch.setAttribute('disabled', '');
      landing.classList.add('loading');
    } else {
      productSearch.removeAttribute('disabled');
      landing.classList.remove('loading');
    }
  };
  document.setMainLoading = setMainLoading;

  // Sets loading true on submit
  const submitTrigger = () => {
    document.setMainLoading(true);
  };
  productSearch.addEventListener('submit', submitTrigger);
}

export default loadingFeedback;
