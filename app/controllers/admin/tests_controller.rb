class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy start]


  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to admin_test_url(@test), notice: 'New test has been successfully created'
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_url(@test), notice: 'The test has been successfully updated'
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to test_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test), notice: 'The test has been successfully deleted'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
