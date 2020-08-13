class NotificationMailer < ApplicationMailer

  def new_comment
    @user = params[:user]
    @comment = params[:comment]
    @answer = params[:answer]
    mail(to: @user.email, subject: "Nouveau message de #{@answer.user.full_name}")
  end
end
