document.addEventListener('turbolinks:load', function () {
  const control = document.querySelector('.sort-by-title');

  if (control) {
    control.addEventListener('click', sortRowsByTitle);
  }

});


function sortRowsByTitle() {
  const table = document.querySelector('table');
  const rows = table.querySelectorAll('tr');

  const sortedRows = [];

  for (let i = 1; i < rows?.length; i++) {
    sortedRows.push(rows[i]);
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc);
    this.querySelector('.octicon-arrow-up').classList.remove('hide');
    this.querySelector('.octicon-arrow-down').classList.add('hide');
  } else {
    sortedRows.sort(compareRowsDesc);
    this.querySelector('.octicon-arrow-up').classList.add('hide');
    this.querySelector('.octicon-arrow-down').classList.remove('hide');
  }

  const sortedTable = document.createElement('table');
  const tBody = document.createElement('tbody');
  sortedTable.classList.add('table', 'table-striped', 'table-hover');
  tBody.appendChild(rows[0]);


  for (let i = 0; i < sortedRows.length; i++) {
    tBody.appendChild(sortedRows[i]);
  }

  sortedTable.appendChild(tBody);
  table.parentNode.replaceChild(sortedTable, table);
}


function compareRowsAsc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent;
  const testTitle2 = row2.querySelector('td').textContent;

  if (testTitle1 < testTitle2) {
    return -1;
  }

  if (testTitle1 > testTitle2) {
    return 1;
  }

  return 0;
}

function compareRowsDesc(row1, row2) {
  const testTitle1 = row1.querySelector('td').textContent;
  const testTitle2 = row2.querySelector('td').textContent;

  if (testTitle1 > testTitle2) {
    return -1;
  }

  if (testTitle1 < testTitle2) {
    return 1;
  }

  return 0;
}
