class GistsController < ApplicationController
  before_action :set_test_passage, only: :create

  def create
    gist_question_service = GistQuestionService.new(@test_passage).call

    link = helpers.link_to "Gist", gist_question_service.url, target: "_blank"

    flash_options = if gist_question_service.success
        { notice: t(".success", link: link) }
      else
        { notice: t(".failure") }
      end

    redirect_to @test_passage, flash_options
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage])
  end
end
