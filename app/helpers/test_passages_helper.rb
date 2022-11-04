module TestPassagesHelper

  def define_result
    if @test_passage.passed?
      content_tag(:p, "Test passed", class: "test_passed")
    else
      content_tag(:p, "Test not passed", class: "test_not_passed")
    end
  end

  def question_number(question)
    question_number = @test_passage.test.questions.index(question) + 1
    content_tag(:h4, "Question № #{question_number}")
  end
end
