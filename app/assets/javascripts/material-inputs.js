var materialInputsModule = (function () {
  var init =  function() {
    var materialInputs = document.querySelectorAll('.material-input');

    [].forEach.call(materialInputs, function(materialInput) {
      materialInput.addEventListener('change', onInputChange);
      materialInput.addEventListener('keyup', onInputChange);
      materialInput.addEventListener('focus', onInputFocus, true);
      materialInput.addEventListener('blur', onInputBlur, true);

      var input = materialInput.querySelector('input');
      input.value ? input.classList.add('has-value') : input.classList.remove('has-value');
    });
  }

  var onInputChange = function(e) {
    e.target.value ? e.target.classList.add('has-value') : e.target.classList.remove('has-value');
  }

  var onInputFocus = function(e) {
    e.target.dataset.placeholder ? e.target.setAttribute('placeholder', e.target.dataset.placeholder) : false;
  }


  var onInputBlur = function(e) {
    e.target.setAttribute('placeholder', '');
  }

  return {
    init: init,
  };
})();

document.addEventListener('DOMContentLoaded', materialInputsModule.init);