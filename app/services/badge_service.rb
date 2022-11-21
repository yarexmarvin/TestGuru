require_relative "./badge_rules/success_at_first_try"
require_relative "./badge_rules/complete_category_tests"
require_relative "./badge_rules/complete_level_tests.rb"

class BadgeService
  RULES = [
    { value: "success_at_first_try", title: "За успешное прохождения теста с первого раза" },
    { value: "complete_category_tests", title: "За прохождение всех тестов из категории" },
    { value: "complete_level_tests", title: "За прохождение всех тестов по уровню" },
  ]

  RULE = {
    success_at_first_try: SuccessAtFirsTry,
    complete_category_tests: CompleteCategoryTests,
    complete_level_tests: CompleteLeveTests,
  }

  def initialize(test_passage)
    @user = test_passage.user
    @current_test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      if RULE[badge.rule.to_sym].new(@user, @current_test).completed?
        @user.badges << badge
      end
    end
  end
end
