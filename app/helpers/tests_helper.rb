module TestsHelper
  LEVELS = %i[trainee beginner intermediate difficult hard extreme].freeze

  def questions_amount(test)
    test.questions.count
  end

  def level_translation(level)
    LEVELS[level]
  end

  def completed?(test)
    completed_passages = TestPassage.all.filter { |passage| passage.completed? }.pluck(:test_id)

    completed_passages.include?(test.id)
  end
end
