class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages, dependent: :destroy

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :by_category, ->(category) { joins(:category).where(categories: { id: category }) }
  scope :by_level, ->(level) { where(level: level) }
  scope :descending, -> { order(title: :desc) }

  def self.tests_by_category(category)
    by_category(category).descending
  end

  def self.tests_by_level(level)
    by_level(level).descending
  end

  def completed?
    completed_passages = TestPassage.all.filter { |passage| passage.completed? }.pluck(:test_id)

    completed_passages.include?(self.id)
  end
  
end
