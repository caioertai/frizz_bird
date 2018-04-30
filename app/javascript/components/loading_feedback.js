function loadingFeedback() {
  const productSearchForm = document.getElementById('product-search');
  const productSearchInput = document.getElementById('query');
  const landing = document.getElementById('landing');

  // Adds loading function to document
  const setMainLoading = (state) => {
    if (state) {
      landing.classList.add('loading');
      productSearchForm.setAttribute('disabled', '');
      // Timeout needed to delay form disabling until parameters are sent
      setTimeout(() => { productSearchInput.setAttribute('disabled', ''); }, 0);
    } else {
      landing.classList.remove('loading');
      productSearchForm.removeAttribute('disabled');
      productSearchInput.removeAttribute('disabled');
    }
  };
  document.setMainLoading = setMainLoading;

  // Sets loading true on submit
  const submitTrigger = () => {
    document.setMainLoading(true);
  };
  productSearchForm.addEventListener('submit', submitTrigger);
}

export default loadingFeedback;
