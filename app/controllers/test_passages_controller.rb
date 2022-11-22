class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  
  before_action :set_test_passage, only: %i[show update result]
  before_action :check_time_left, only: %i[show update]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def check_time_left
    redirect_to result_test_passage_path(@test_passage) if time_left?
  end

  def time_left?
    @test_passage.created_at + @test_passage.test.timer * 60 - Time.now <= 0 ? true : false
  end
end
