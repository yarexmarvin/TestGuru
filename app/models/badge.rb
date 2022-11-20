class Badge < ApplicationRecord
  has_many :given_badges, dependent: :nullify
  has_many :users, through: :given_badges

  validates :title, presence: true
  validates :rule, presence: true
  validates :url, presence: true, format: { with: URI::regexp(%w(http https)) }
end
