class User < ApplicationRecord

  has_many :created_tests, class_name: "Test", foreign_key: :author_id

  has_many :passed_tests
  has_many :tests, through: :passed_tests

  def passed_tests_by_level(level)
    Test.joins("INNER JOIN passed_tests ON tests.id = passed_tests.test_id ")
      .where(passed_tests: { user_id: id }, level: level);
  end
end