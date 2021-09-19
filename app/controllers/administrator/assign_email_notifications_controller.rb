class Administrator::AssignEmailNotificationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @notifications = @user.assign_email_notifications
    authorize [:administrator, @notifications]
  end

  # This method changes the active status to activated or deactivated
  def change_status
    # We get the assignment email id from de submission, those ones that have to be activated
    @assignment = AssignEmailNotification.find(params[:id])
    @assignment.update_active_status
    if @assignment.active_previously_changed?
      redirect_to administrator_user_email_notifications_path, notice: t('admin.assign_email_notification.change_status.notice')
    else
      redirect_to administrator_user_email_notifications_path, alert: t('admin.assign_email_notification.change_status.alert')
    end
  end
end
