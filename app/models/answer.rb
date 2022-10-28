class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answers_amount, on: :create
  

  private

  def validate_answers_amount
    errors.add(:answer, "the current question can only have no more than 4 answers") if question.answers.count >= 1
  end
end
