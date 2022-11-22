class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  SUCCESS_RATIO = 0.85

  def passed?
    correct_questions / self.test.questions.count.to_f >= SUCCESS_RATIO
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_set_current_question
    return unless test.questions || self.completed?

    if new_record?
      self.current_question = test.questions.first
    else
      self.current_question = next_question
    end
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def get_timer
    self.created_at + self.test.timer * 60 - Time.now
  end
  
end
