class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: :author_id, dependent: :destroy
  has_many :passed_tests
  has_many :tests, through: :passed_tests, dependent: :destroy

  validates :email, presence: true

  def passed_tests_by_level(level)
    tests.where(level:)
  end

end
