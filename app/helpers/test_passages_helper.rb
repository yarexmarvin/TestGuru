module TestPassagesHelper
  def define_result
    if @test_passage.passed?
      "<p class='test_passed'>test passed</p>".html_safe
    else
      "<p class='test_not_passed'>test not passed</p>".html_safe
    end
  end

  def question_number(question)
    "<h4>Question № #{@test_passage.test.questions.index(question) + 1} </h4>".html_safe
  end
end
