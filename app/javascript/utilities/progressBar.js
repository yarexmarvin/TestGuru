document.addEventListener('turbolinks:load', function () {

  const progressBar = document.querySelector('.progress-bar-inner');

  const questionsCount = progressBar?.dataset?.questionsCount;
  const questionNumber = progressBar?.dataset?.questionNumber;

  if (questionsCount && questionNumber) {
    const progress = ((Number(questionNumber) + 1) / Number(questionsCount)) * 100;
    progressBar.style.width = `${progress}%`;
  }


});

