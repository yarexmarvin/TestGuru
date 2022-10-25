class User < ApplicationRecord
  def passed_tests_by_level(level)
    Test.joins("INNER JOIN passed_tests ON tests.id = passed_tests.test_id ")
      .where(passed_tests: { user_id: id }, level: level);
  end
end
