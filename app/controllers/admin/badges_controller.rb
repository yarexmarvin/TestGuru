class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[edit update destroy]

  def new
    @badge = Badge.new
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to badges_path
    else
      render :edit
    end
  end

  def create
    @badge = Badge.new(badge_params)
    if (@badge.save)
      redirect_to badges_path, notice: "A new badge has been created!"
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to badges_path
  end

  def badge_params
    params.require(:badge).permit(:title, :url, :rule)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
