class Admin::GistsController < Admin::BaseController
  before_action :set_test_passage, only: :create

  def index
    @gists = Gist.all
  end

  def create
    new_gist = GistQuestionService.new(@test_passage)
    result = new_gist.call

    if new_gist.success?
      #   current_user.gists.create(url: result.id, question_id: @test_passage.current_question.id)
      link = helpers.link_to "gist", result.url, target: "_blank"

      flash_options = { notice: t(".success") + " #{link}" }
    else
      flash_options = { notice: t(".failure") }
    end

    redirect_to @test_passage, flash_options
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage])
  end
end
