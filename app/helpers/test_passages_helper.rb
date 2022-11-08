module TestPassagesHelper

  def define_result
    if @test_passage.passed?
      content_tag(:p,  t('.test_passed'), class: "test_passed")
    else
      content_tag(:p,  t('.test_not_passed'), class: "test_not_passed")
    end
  end

  def question_number(question)
    question_number = @test_passage.test.questions.index(question) + 1
    content_tag(:h4, t('.question_title', question_number: question_number))
  end
end
