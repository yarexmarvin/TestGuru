class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests, dependent: :destroy

  def self.test_by_category(category)
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
