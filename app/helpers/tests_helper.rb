module TestsHelper
  LEVELS = %i[trainee beginner intermediate difficult hard extreme].freeze

  def questions_amount(test)
    test.questions.count
  end

  def level_translation(level)
    LEVELS[level]
  end

end
