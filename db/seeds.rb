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
    { name: "Mike", login: "mike77", email:'asdasd@asdas.ere', password: "cool-mike-77" },
    { name: "Brian", login: "brian1",email:'as2asd@adas.ere', password: "brian1-1-1" },
    { name: "Kate", login: "kate90", email:'as234asd@aas.ere', password: "kate-brown1990", user_type: "admin" },
  ])

tests = Test.create!([
  { title: "HTML", level: 0, category_id: categories[0].id, author_id: users[2].id },
  { title: "CSS", level: 1, category_id: categories[0].id, author_id: users[2].id },
  { title: "JavaScript", level: 2, category_id: categories[0].id, author_id: users[2].id },
  { title: "Ruby", level: 3, category_id: categories[1].id, author_id: users[2].id },
  { title: "Ruby on Rails", level: 3, category_id: categories[1].id, author_id: users[2].id },
  { title: "Swift", level: 3, category_id: categories[2].id, author_id: users[2].id },
  { title: "Kotlin", level: 3, category_id: categories[2].id, author_id: users[2].id },
])

questions = Question.create!([
  { body: "How many types of heading does an HTML contain?", test_id: tests[0].id },
  { body: "What are the different types of Selectors in CSS?", test_id: tests[1].id },
  { body: " What are the different data types present in javascript?", test_id: tests[2].id },
  { body: "Difference between var and let keyword in javascript?", test_id: tests[2].id },
  { body: " Are class variables inherited? ", test_id: tests[3].id },
  { body: "What is ORM(Object-Relationship-Model)?", test_id: tests[4].id },
  { body: "What is typealias in Swift?", test_id: tests[5].id },
  { body: "How do you declare variables in Kotlin?", test_id: tests[5].id },
])

answers = Answer.create!([
  { body: "HTML defines six levels of headings", correct: true, question_id: questions[0].id },
  { body: "Element, Id , Class, Universal selectors only", correct: false, question_id: questions[1].id },
  { body: "JavaScript has 8 types: undefined, null, boolean, number, bigint, string, symbol, and object", correct: true, question_id: questions[2].id },
  { body: "There is no differences between var and let", correct: false, question_id: questions[3].id },
  { body: "No. The behavior is different than inheritance. Any alteration of a class variable by a subclass affects that class variable in the superclass and all other subclasses of the superclass.", correct: true, question_id: questions[4].id },
  { body: "Object–relational mapping in computer science is a programming technique for converting data between type systems using object-oriented programming languages. ", correct: true, question_id: questions[5].id},
  { body: "In Swift, typealias is a class that gives a new name, or an alias, to an existing type.", correct: false, question_id: questions[6].id },
  { body: "Kotlin uses two different keywords to declare variables: ral and var ", correct: false, question_id: questions[7].id },
])

passed_tests = PassedTest.create!([
  { user_id: users[0].id, test_id: tests[1].id },
  { user_id: users[1].id, test_id: tests[3].id },
  { user_id: users[0].id, test_id: tests[2].id },
  { user_id: users[1].id, test_id: tests[4].id },
])
