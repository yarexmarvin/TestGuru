class SessionsController < ApplicationController

  skip_before_action :authenticate_user!, :raise => false

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:requested_page) || tests_path
    else
      flash.now[:alert] = 'Wrong password or login!'
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
