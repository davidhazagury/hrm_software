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
      redirect_to administrator_email_notifications_path, notice: "Alerta creada correctamente."
    else
      render :new
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
      redirect_to administrator_email_notifications_path, notice: "Alerta actualizada correctamente."
    else
      render :edit
    end
  end

  def destroy
    @alert = EmailNotification.find(params[:id])
    authorize [:administrator, @alert]
    if @alert.destroy
      redirect_to administrator_email_notifications_path, notice: "Álerta elimanada correctamente."
    else
      redirect_to administrator_email_notifications_path, alert: "No se ha podido eliminar el alerta"
    end
  end

  private

  def alert_params
    params.require(:email_notification).permit(:notification, :description)
  end
end
