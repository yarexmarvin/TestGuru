class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def passed?
    p correct_questions.to_f
    p self.test.questions.count.to_f

    correct_questions.to_f / self.test.questions.count.to_f > 0.85
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def correct_answer?(answer_ids)

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort

  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    puts current_question.id
    test.questions.order(:id).where("id > ?", current_question.id).first
  end
end
