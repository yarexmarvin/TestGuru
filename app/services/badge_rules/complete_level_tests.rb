class CompleteLeveTests
  def initialize(user, current_test)
    @user = user
    @test = current_test
  end

  def completed?
    all_tests_by_level = Test.tests_by_level(@test.level).pluck(:id)
    all_passed_users_tests = @user.test_passages.filter { |test_passage| test_passage.passed? }.pluck(:test_id)
    return true if all_passed_users_tests.keep_if { |test_id| all_tests_by_level.include?(test_id) }.uniq.size === all_tests_by_level.size
  end
end
