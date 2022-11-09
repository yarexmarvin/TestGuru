module QuestionsHelper

  def question_header(question)
    if question.persisted?
      t("questions_helper.edit_header", question: question.test.title)
    else
      t("questions_helper.create_header", question: question.test.title)
    end
  end
end
