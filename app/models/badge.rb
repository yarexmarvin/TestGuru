class Badge < ApplicationRecord
  RULES = [
    { value: "complete_first_try", title: "За успешное прохождения теста с первого раза" },
    { value: "complete_category_tests", title: "За прохождение всех тестов из категории" },
    { value: "complete_level_tests", title: "За прохождение всех тестов по уровню" },
  ].freeze

  RULES_KEYS = RULES.map { |rule| rule[:value] }

  has_many :given_badges, dependent: :nullify
  has_many :users, through: :given_badges

  validates :title, presence: true
  validates :rule, presence: true, inclusion: { in: RULES_KEYS }
  validates :url, presence: true, format: { with: URI::regexp(%w(http https)) }
end
