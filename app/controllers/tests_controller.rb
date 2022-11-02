class TestsController < ApplicationController

  before_action :set_user, only: :start
  before_action :set_test, only: :start

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def start
    @user.tests.push(@test)
    p @user.test_passage(@test)
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
