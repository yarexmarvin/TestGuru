class TestPassagesController < ApplicationController
  before_action :set_test_passage

  # rescue_from TestPassagesController::NoMethodError, with: :rescue_with_test_passage_question_not_found

  def show
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def rescue_with_test_passage_question_not_found
    render plan: "test is not available"
  end
end
