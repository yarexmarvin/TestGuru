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
    { name: "Mike", login: "mike77", password: "cool-mike-77" },
    { name: "Brian", login: "brian1", password: "brian1-1-1" },
    { name: "Kate", login: "kate90", password: "kate-brown1990", user_type: "admin" },
  ])

tests = Test.create!([
  { title: "HTML", level: 0, category_id: categories[0], author_id: users[2] },
  { title: "CSS", level: 1, category_id: categories[0], author_id: users[2] },
  { title: "JavaScript", level: 2, category_id: categories[0], author_id: users[2] },
  { title: "Ruby", level: 3, category_id: categories[1], author_id: users[2] },
  { title: "Ruby on Rails", level: 3, category_id: categories[1], author_id: users[2] },
  { title: "Swift", level: 3, category_id: categories[2], author_id: users[2] },
  { title: "Kotlin", level: 3, category_id: categories[2], author_id: users[2] },
])

questions = Question.create!([
  { body: "How many types of heading does an HTML contain?", test_id: tests[0] },
  { body: "What are the different types of Selectors in CSS?", test_id: tests[1] },
  { body: " What are the different data types present in javascript?", test_id: tests[2] },
  { body: "Difference between var and let keyword in javascript?", test_id: tests[2] },
  { body: " Are class variables inherited? ", test_id: tests[3] },
  { body: "What is ORM(Object-Relationship-Model)?", test_id: tests[4] },
  { body: "What is typealias in Swift?", test_id: tests[5] },
  { body: "How do you declare variables in Kotlin?", test_id: tests[5] },
])

answers = Answer.create!([
  { body: "HTML defines six levels of headings", correct: true, question_id: questions[0] },
  { body: "Element, Id , Class, Universal selectors only", correct: false, question_id: questions[1] },
  { body: "JavaScript has 8 types: undefined, null, boolean, number, bigint, string, symbol, and object", correct: true, question_id: questions[2] },
  { body: "There is no differences between var and let", correct: false, question_id: questions[3] },
  { body: "No. The behavior is different than inheritance. Any alteration of a class variable by a subclass affects that class variable in the superclass and all other subclasses of the superclass.", correct: true, question_id: questions[4] },
  { body: "Object–relational mapping in computer science is a programming technique for converting data between type systems using object-oriented programming languages. ", correct: true, question_id: questions[5]},
  { body: "In Swift, typealias is a class that gives a new name, or an alias, to an existing type.", correct: false, question_id: questions[6] },
  { body: "Kotlin uses two different keywords to declare variables: ral and var ", correct: false, question_id: questions[7] },
])

passed_tests = PassedTest.create!([
  { user_id: users[0], test_id: tests[1] },
  { user_id: users[1], test_id: tests[3] },
  { user_id: users[0], test_id: tests[2] },
  { user_id: users[1], test_id: tests[4] },
])
