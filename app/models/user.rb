class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: :author_id, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests, dependent: :destroy

  def passed_tests_by_level(level)
    Test.joins(:passed_tests)
      .where(passed_tests: { user_id: id }, level: level)
  end
end
