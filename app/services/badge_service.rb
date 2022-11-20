class BadgeService

  RULES = [
    {rule_id: 1, value: 'success_at_first_try', title: 'За успешное прохождения теста с первого раза'},
    {rule_id: 2, value: 'complete_category_tests', title: 'За прохождение всех тестов из категории'},
    {rule_id: 1, value: 'complete_level_tests', title: 'За прохождение всех тестов по уровню'},
  ]

  def initialize(test_passage)
    @user = test_passage.user
    @current_test = test_passage.test
    @badges = Badge.all
  end

  def call

    @badges.each do  |badge|
      if send("#{badge&.rule}")
        @user.badges << badge
     BadgeService end
    end

  end

  private

  def success_at_first_try
    current_test_passages = @user.test_passages.filter { |test_passage| test_passage.test_id == @current_test.id && test_passage.user_id == @user.id  }
    current_test_passages_completed = current_test_passages.filter { |test_passage| test_passage.passed? }
    if current_test_passages.count == 1 && current_test_passages_completed.count == 1
      return true
    end
    return false
  end


  def complete_category_tests
    all_tests_in_category = Test.tests_by_category(@current_test.category_id).pluck(:id)
    all_passed_users_tests = @user.test_passages.filter { |test_passage| test_passage.passed? }.pluck(:test_id)
    return true if all_passed_users_tests.keep_if {|test_id| all_tests_in_category.include?(test_id) }.uniq.size === all_tests_in_category.size 
    return false
  end


  def complete_level_tests
    all_tests_by_level = Test.tests_by_level(@current_test.level).pluck(:id)
    all_passed_users_tests = @user.test_passages.filter { |test_passage| test_passage.passed? }.pluck(:test_id)
    return true if all_passed_users_tests.keep_if {|test_id| all_tests_by_level.include?(test_id) }.uniq.size === all_tests_by_level.size 
  end

end
