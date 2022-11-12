class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  VALID_EMAIL = (/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i).freeze

  has_many :created_tests, class_name: "Test", foreign_key: :author_id, dependent: :destroy

  has_many :gists, dependent: :destroy
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: VALID_EMAIL }


  def passed_tests_by_level(level)
    tests.where(level:)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test)
  end

  def admin?
    self.is_a?(Admin)
  end

end
