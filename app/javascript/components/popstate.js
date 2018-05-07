document.goTo = (actionName) => {
  const actionElement = document.getElementById(`${actionName}`);
  document.querySelectorAll('.content').forEach((element) => { element.classList.add('d-none'); });
  actionElement.classList.remove('d-none');
  document.smoothScrollTo(actionElement);
};

function popstate() {
  window.onpopstate = (event) => {
    const actionName = event.state && event.state.action;
    if (actionName) {
      // Checks content and gets if empty
      const actionElement = document.getElementById(actionName);
      if (actionElement.querySelector('.container').innerHTML === '') {
        const fullPath = window.location.pathname + window.location.search;
        document.setMainLoading(true);
        $.get(fullPath);
      } else {
        document.goTo(actionName);
      }
    }
  };
}

export default popstate;
