class FeedbackMailer < ApplicationMailer

  def send_feedback(current_user, message)

    @user = current_user
    @message = message
    @admin_email = ENV['ADMIN_MAIL']
    mail to: @admin_email, subject: "Сообщение от пользователя #{@user.email}"
  end
end
