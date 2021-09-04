class Administrator::AssignEmailNotificationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @notifications = EmailNotification.all
  end

  def assign_email_notifications
    raise
  end

end
