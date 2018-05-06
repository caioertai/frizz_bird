function popstate() {
  window.onpopstate = (event) => {
    document.querySelectorAll('.content').forEach((element) => { element.classList.add('d-none'); });
    const actionName = event.state.page;
    const actionElement = document.getElementById(actionName);
    actionElement.classList.remove('d-none');
  };
}

export default popstate;
