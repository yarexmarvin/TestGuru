module QuestionsHelper

  def question_header(question)
    if question.persisted?
        "Edit #{question.test.title}'s question"
    else
        "Create a new question for #{question.test.title} test"
    end
  end

end
