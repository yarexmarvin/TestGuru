# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([
  { title: "Frontend" },
  { title: "Backend" },
  { title: "Mobile Development" },
])

users = User.create!([
  { first_name: "Yarex", last_name: 'Marvin', email: "m4tveev.jaroslav@yandex.ru", password: 'admin12345', type: "Admin" },
])

tests = Test.create!([
  { title: "HTML", level: 0, category_id: categories[0].id, author_id: users[0].id, timer: 15 },
  { title: "JavaScript", level: 2, category_id: categories[0].id, author_id: users[0].id, timer: 15 },
  { title: "Ruby", level: 3, category_id: categories[1].id, author_id: users[0].id, timer: 10 },
  { title: "Ruby on Rails", level: 3, category_id: categories[1].id, author_id: users[0].id, timer: 5 },
  { title: "Swift", level: 3, category_id: categories[2].id, author_id: users[0].id, timer: 20 },
])

questions = Question.create!([
  { body: "Test 1 Question 1 ", test_id: tests[0].id },
  { body: "Test 1 Question 2 ", test_id: tests[0].id },
  { body: "Test 1 Question 3 ", test_id: tests[0].id },
  { body: "Test 1 Question 4 ", test_id: tests[0].id },
  { body: "Test 1 Question 5 ", test_id: tests[0].id },
  { body: "Test 2 Question 1 ", test_id: tests[1].id },
  { body: "Test 2 Question 2 ", test_id: tests[1].id },
  { body: "Test 2 Question 3 ", test_id: tests[1].id },
  { body: "Test 2 Question 4 ", test_id: tests[1].id },
  { body: "Test 2 Question 5 ", test_id: tests[1].id },
  { body: "Test 3 Question 1 ", test_id: tests[2].id },
  { body: "Test 3 Question 2 ", test_id: tests[2].id },
  { body: "Test 3 Question 3 ", test_id: tests[2].id },
  { body: "Test 3 Question 4 ", test_id: tests[2].id },
  { body: "Test 3 Question 5 ", test_id: tests[2].id },
  { body: "Test 4 Question 1 ", test_id: tests[3].id },
  { body: "Test 4 Question 2 ", test_id: tests[3].id },
  { body: "Test 4 Question 3 ", test_id: tests[3].id },
  { body: "Test 4 Question 4 ", test_id: tests[3].id },
  { body: "Test 4 Question 5 ", test_id: tests[3].id },
  { body: "Test 5 Question 1 ", test_id: tests[4].id },
  { body: "Test 5 Question 2 ", test_id: tests[4].id },
  { body: "Test 5 Question 3 ", test_id: tests[4].id },
  { body: "Test 5 Question 4 ", test_id: tests[4].id },
  { body: "Test 5 Question 5 ", test_id: tests[4].id },

])

answers = Answer.create!([
  { body: "Question 1 Answer 1", correct: true, question_id: questions[0].id },
  { body: "Question 1 Answer 2", correct: false, question_id: questions[0].id },
  { body: "Question 1 Answer 3", correct: false, question_id: questions[0].id },
  { body: "Question 2 Answer 1", correct: true, question_id: questions[1].id },
  { body: "Question 2 Answer 2", correct: false, question_id: questions[1].id },
  { body: "Question 2 Answer 3", correct: false, question_id: questions[1].id },
  { body: "Question 3 Answer 1", correct: true, question_id: questions[2].id },
  { body: "Question 3 Answer 2", correct: false, question_id: questions[2].id },
  { body: "Question 3 Answer 3", correct: false, question_id: questions[2].id },
  { body: "Question 4 Answer 1", correct: false, question_id: questions[3].id },
  { body: "Question 4 Answer 2", correct: false, question_id: questions[3].id },
  { body: "Question 4 Answer 3", correct: true, question_id: questions[3].id },
  { body: "Question 5 Answer 1", correct: false, question_id: questions[4].id },
  { body: "Question 5 Answer 2", correct: true, question_id: questions[4].id },
  { body: "Question 5 Answer 3", correct: false, question_id: questions[4].id },

  { body: "Question 1 Answer 1", correct: true, question_id: questions[5].id },
  { body: "Question 1 Answer 2", correct: false, question_id: questions[5].id },
  { body: "Question 1 Answer 3", correct: false, question_id: questions[5].id },
  { body: "Question 2 Answer 1", correct: true, question_id: questions[6].id },
  { body: "Question 2 Answer 2", correct: false, question_id: questions[6].id },
  { body: "Question 2 Answer 3", correct: false, question_id: questions[6].id },
  { body: "Question 3 Answer 1", correct: true, question_id: questions[7].id },
  { body: "Question 3 Answer 2", correct: false, question_id: questions[7].id },
  { body: "Question 3 Answer 3", correct: false, question_id: questions[7].id },
  { body: "Question 4 Answer 1", correct: false, question_id: questions[8].id },
  { body: "Question 4 Answer 2", correct: false, question_id: questions[8].id },
  { body: "Question 4 Answer 3", correct: true, question_id: questions[8].id },
  { body: "Question 5 Answer 1", correct: false, question_id: questions[9].id },
  { body: "Question 5 Answer 2", correct: true, question_id: questions[9].id },
  { body: "Question 5 Answer 3", correct: false, question_id: questions[9].id },

  { body: "Question 1 Answer 1", correct: true, question_id: questions[10].id },
  { body: "Question 1 Answer 2", correct: false, question_id: questions[10].id },
  { body: "Question 1 Answer 3", correct: false, question_id: questions[10].id },
  { body: "Question 2 Answer 1", correct: true, question_id: questions[11].id },
  { body: "Question 2 Answer 2", correct: false, question_id: questions[11].id },
  { body: "Question 2 Answer 3", correct: false, question_id: questions[11].id },
  { body: "Question 3 Answer 1", correct: true, question_id: questions[12].id },
  { body: "Question 3 Answer 2", correct: false, question_id: questions[12].id },
  { body: "Question 3 Answer 3", correct: false, question_id: questions[12].id },
  { body: "Question 4 Answer 1", correct: false, question_id: questions[13].id },
  { body: "Question 4 Answer 2", correct: false, question_id: questions[13].id },
  { body: "Question 4 Answer 3", correct: true, question_id: questions[13].id },
  { body: "Question 5 Answer 1", correct: false, question_id: questions[14].id },
  { body: "Question 5 Answer 2", correct: true, question_id: questions[14].id },
  { body: "Question 5 Answer 3", correct: false, question_id: questions[14].id },

  { body: "Question 1 Answer 1", correct: true, question_id: questions[15].id },
  { body: "Question 1 Answer 2", correct: false, question_id: questions[15].id },
  { body: "Question 1 Answer 3", correct: false, question_id: questions[15].id },
  { body: "Question 2 Answer 1", correct: true, question_id: questions[16].id },
  { body: "Question 2 Answer 2", correct: false, question_id: questions[16].id },
  { body: "Question 2 Answer 3", correct: false, question_id: questions[16].id },
  { body: "Question 3 Answer 1", correct: true, question_id: questions[17].id },
  { body: "Question 3 Answer 2", correct: false, question_id: questions[17].id },
  { body: "Question 3 Answer 3", correct: false, question_id: questions[17].id },
  { body: "Question 4 Answer 1", correct: false, question_id: questions[18].id },
  { body: "Question 4 Answer 2", correct: false, question_id: questions[18].id },
  { body: "Question 4 Answer 3", correct: true, question_id: questions[18].id },
  { body: "Question 5 Answer 1", correct: false, question_id: questions[19].id },
  { body: "Question 5 Answer 2", correct: true, question_id: questions[19].id },
  { body: "Question 5 Answer 3", correct: false, question_id: questions[19].id },

  { body: "Question 1 Answer 1", correct: true, question_id: questions[20].id },
  { body: "Question 1 Answer 2", correct: false, question_id: questions[20].id },
  { body: "Question 1 Answer 3", correct: false, question_id: questions[20].id },
  { body: "Question 2 Answer 1", correct: true, question_id: questions[21].id },
  { body: "Question 2 Answer 2", correct: false, question_id: questions[21].id },
  { body: "Question 2 Answer 3", correct: false, question_id: questions[21].id },
  { body: "Question 3 Answer 1", correct: true, question_id: questions[22].id },
  { body: "Question 3 Answer 2", correct: false, question_id: questions[22].id },
  { body: "Question 3 Answer 3", correct: false, question_id: questions[22].id },
  { body: "Question 4 Answer 1", correct: false, question_id: questions[23].id },
  { body: "Question 4 Answer 2", correct: false, question_id: questions[23].id },
  { body: "Question 4 Answer 3", correct: true, question_id: questions[23].id },
  { body: "Question 5 Answer 1", correct: false, question_id: questions[24].id },
  { body: "Question 5 Answer 2", correct: true, question_id: questions[24].id },
  { body: "Question 5 Answer 3", correct: false, question_id: questions[24].id },

])

test_passages = TestPassage.create!([
  { user_id: users[0].id, test_id: tests[1].id },
])
