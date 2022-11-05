class TestsController < ApplicationController

  before_action :authenticate_user!, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def start
    set_test
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  
  private

  def set_test
    @test = Test.find(params[:id])
  end

end
