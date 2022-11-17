class FeedbacksController < ApplicationController
  def create
    unless params[:message].nil?
      FeedbackMailer.send_feedback(current_user, params[:message]).deliver_now
      redirect_to root_path, { notice: "Сообщение отправлено" }
    end
  end

  
end
