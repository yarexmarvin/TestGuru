class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def start
    set_user
    set_test
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  
  private
  def set_user
    @user = User.first
  end

  def set_test
    @test = Test.find(params[:id])
  end

end
