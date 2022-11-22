# require_relative "./badge_rules/badge_rules"

class BadgeService
  def initialize(test_passage)
    @user = test_passage.user
    @current_test = test_passage.test
    @rules_service = BadgeRulesService.new(@user, @current_test)
  end

  def call
    Badge.find_each do |badge|
      @user.badges << badge if @rules_service.send(badge.rule)
    end
  end
end
