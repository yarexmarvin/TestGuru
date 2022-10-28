class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  scope :ascending, -> { order(title: :asc) }

  validates :title, presence: true

end
