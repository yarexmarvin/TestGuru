class SuccessAtFirsTry
  def initialize(user, current_test)
    @user = user
    @test = current_test
  end

  def completed?
    current_test_passages = @user.test_passages.filter { |test_passage| test_passage.test_id == @test.id && test_passage.user_id == @user.id }
    current_test_passages_completed = current_test_passages.filter { |test_passage| test_passage.passed? }
    if current_test_passages.count == 1 && current_test_passages_completed.count == 1
      return true
    end
    return false
  end
end
