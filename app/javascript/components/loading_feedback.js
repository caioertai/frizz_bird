function loadingFeedback() {
  const productSearchForm = document.getElementById('product-search');
  const productTopbarSearchForm = document.getElementById('topbar-product-search');
  const productSearchInput = document.getElementById('query');
  const productTopbarSearchInput = document.getElementById('topbar-query');
  const body = document.getElementById('body');

  // Adds loading function to document
  const setMainLoading = (state) => {
    if (state) {
      body.classList.add('loading');
      productSearchForm.setAttribute('disabled', '');
      productTopbarSearchForm.setAttribute('disabled', '');
      // Timeout needed to delay form disabling until parameters are sent
      setTimeout(() => { productSearchInput.setAttribute('disabled', ''); }, 0);
      setTimeout(() => { productTopbarSearchInput.setAttribute('disabled', ''); }, 0);
    } else {
      body.classList.remove('loading');
      productSearchForm.removeAttribute('disabled');
      productTopbarSearchForm.removeAttribute('disabled');
      productSearchInput.removeAttribute('disabled');
      productTopbarSearchInput.removeAttribute('disabled');
    }
  };
  document.setMainLoading = setMainLoading;

  // Sets loading true on submit
  const submitTrigger = () => {
    document.setMainLoading(true);
  };
  productSearchForm.addEventListener('submit', submitTrigger);
  productTopbarSearchForm.addEventListener('submit', submitTrigger);
}

export default loadingFeedback;
