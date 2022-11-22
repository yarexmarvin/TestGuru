document.addEventListener('turbolinks:load', function () {

  const timerSelector = document.querySelector('.timer');
  const form = document.querySelector('form');

  if (timerSelector) {
    let time = timerSelector.dataset.timer;


    let timer = setInterval(() => {
      timerSelector.innerHTML = "Time left: ";
      if (time <= 0) {
        clearInterval(timer);
        form.submit();
      }

      let minutes = Math.floor(time / 60);
      let seconds = Math.floor(time % 60);

      if (minutes > 0) {
        timerSelector.innerHTML += `${minutes} minutes`;
      }

      if (seconds !== 60 && seconds >= 0) {
        timerSelector.innerHTML += ` ${seconds} seconds`;
      }

      time--;

    }, 1000);

  }
});
