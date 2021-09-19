class Administrator::EmailNotificationsController < ApplicationController

  def index
    @alerts = policy_scope([:administrator, EmailNotification.order(:notification)])
  end

  def new
    @alert = EmailNotification.new
    authorize [:administrator, @alert]
  end

  def create
    @alert = EmailNotification.new(alert_params)
    authorize [:administrator, @alert]
    if @alert.save
      redirect_to administrator_email_notifications_path, notice: t('admin.email_notification.create.notice')
    else
      render :new, alert: t('admin.email_notification.create.alert')
    end
  end

  def edit
    @alert = EmailNotification.find(params[:id])
    authorize [:administrator, @alert]
  end

  def update
    @alert = EmailNotification.find(params[:id])
    authorize [:administrator, @alert]
    if @alert.update(alert_params)
      redirect_to administrator_email_notifications_path, notice: t('admin.email_notification.update.notice')
    else
      render :edit, alert: t('admin.email_notification.update.alert')
    end
  end

  def destroy
    @alert = EmailNotification.find(params[:id])
    authorize [:administrator, @alert]
    if @alert.destroy
      redirect_to administrator_email_notifications_path, notice: t('admin.email_notification.destroy.notice')
    else
      redirect_to administrator_email_notifications_path, alert: t('admin.email_notification.destroy.alert')
    end
  end

  private

  def alert_params
    params.require(:email_notification).permit(:notification, :description)
  end
end
