module TestsHelper
  LEVELS = {
    0 => :trainee,
    1 => :beginner,
    2 => :intermediate,
    3 => :difficult,
    4 => :hard,
    5 => :extreme,
  }

  def questions_amount(test)
    test.questions.count
  end

  def level_translation(level)
    LEVELS[level]
  end
end
