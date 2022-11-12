document.addEventListener('turbolinks:load', function () {
  const registrationForm = document.querySelector('.new_user');

  const passConfirmInput = registrationForm?.querySelector('#user_password_confirmation');

  if (passConfirmInput) {
    passConfirmInput.addEventListener('input', comparePassowrds);
  }

});


function comparePassowrds(e) {

  const userPasswordInput = document.querySelector('#user_password');

  const isEqual = userPasswordInput.value === e.target.value;

  const successIcon = document.querySelector('.octicon-check-circle-fill');
  const failIcon = document.querySelector('.octicon-alert');


  if (e.target.value == '') {
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

