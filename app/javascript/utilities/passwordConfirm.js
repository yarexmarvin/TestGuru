document.addEventListener('turbolinks:load', function () {

  const passInput = document.querySelector('#user_password');
  const passConfirmInput = document.querySelector('#user_password_confirmation');

  if (passConfirmInput && passInput) {
    passInput.addEventListener('input', (e)=> comparePassowrds(e, passConfirmInput ));
    passConfirmInput.addEventListener('input', (e)=> comparePassowrds(e, passInput ));
  }

});


function comparePassowrds(e, input) {

  const inputValue = input.value
  const currentInputValue = e.target.value

  const isEqual = inputValue=== currentInputValue;

  const successIcon = document.querySelector('.octicon-check-circle-fill');
  const failIcon = document.querySelector('.octicon-alert');


  if (inputValue === '' || currentInputValue === '' ) {
    successIcon?.classList.add('hide');
    failIcon?.classList.add('hide');
    return;
  }

  if (isEqual) {
    successIcon?.classList.remove('hide');
    failIcon?.classList.add('hide');
  } else {
    successIcon?.classList.add('hide');
    failIcon?.classList.remove('hide');
  }

}
