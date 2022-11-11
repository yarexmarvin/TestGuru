class GistsController < ApplicationController
  before_action :set_test_passage, only: :create

  def create
    gist_question = GistQuestionService.new(@test_passage).call

    flash_options = if gist_question.success
        { notice: t(".success") + " #{gist_question.url}" }
      else
        { notice: t(".failure") }
      end

    redirect_to @test_passage, flash_options
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage])
  end
end
