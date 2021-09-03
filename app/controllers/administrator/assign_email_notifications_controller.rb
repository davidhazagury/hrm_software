class Administrator::AssignEmailNotificationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @notifications = EmailNotification.all
  end
end
