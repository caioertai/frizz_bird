function loadingFeedback() {
  const mainElements = document.querySelectorAll('.disable-on-loading');
  const formElements = document.querySelectorAll('form.disable-on-loading');
  const body = document.querySelector('body');

  // Adds loading function to document
  const setMainLoading = (state) => {
    if (state) {
      body.classList.add('loading');
      // Timeout needed to delay form disabling until parameters are sent
      setTimeout(() => {
        mainElements.forEach((element) => {
          element.setAttribute('disabled', '');
        });
      }, 0);
    } else {
      body.classList.remove('loading');
      mainElements.forEach((element) => {
        element.removeAttribute('disabled');
      });
    }
  };
  document.setMainLoading = setMainLoading;

  // Sets loading true on submit
  const submitTrigger = () => {
    document.setMainLoading(true);
  };
  formElements.forEach((element) => {
    element.addEventListener('submit', submitTrigger);
  });
}

export default loadingFeedback;
