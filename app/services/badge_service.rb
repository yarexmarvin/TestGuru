class BadgeService
  RULES = {
    complete_category_tests: CompleteCategoryTests,
    complete_level_tests: CompleteLevelTests,
    complete_first_try: CompleteFirstTry
  }.freeze

  def initialize(test_passage)
    @user = test_passage.user
    @current_test = test_passage.test
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule.to_sym].new(@user, @current_test)
      @user.badges << badge if rule.satisfied?
    end
  end
end
