
require_relative './badge_rules/complete_category_tests'
require_relative './badge_rules/complete_level_tests'
require_relative './badge_rules/success_at_first_try'

class BadgeRulesService

  include CompleteCategoryTests
  include CompleteLevelTests
  include SuccessAtFirstTry

  def initialize(current_user, current_test)
    @user = current_user
    @test = current_test
  end


end
