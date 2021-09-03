class Administrator::AlertsController < ApplicationController
  def index
    @alerts = policy_scope([:administrator, Alert.order(:name_of_alert)])
  end
  def new
    @alert = Alert.new
    authorize [:administrator, @alert]
  end

  def create
    @alert = Alert.new(alert_params)
    authorize [:administrator, @alert]
    if @alert.save
      redirect_to administrator_arlert_path, notice: "Alerta creada correctamente."
    else
      render :new
    end
  end

  def edit
    @alert = Alert.find(params[:id])
    authorize [:administrator, @alert]
  end

  def update
    @alert = Alert.find(params[:id])
    authorize [:administrator, @alert]
    if @alert.update(alert_params)
      redirect_to administrator_alerts_path, notice: "Alerta actualizada correctamente."
    else
      render :edit
    end
  end

  def destroy
    @alert = Alert.find(params[:id])
    authorize [:administrator, @alert]
    if @alert.destroy
      redirect_to administrator_alerts_path, notice: "Álerta elimanada correctamente."
    else
      redirect_to administrator_alerts_path, alert: "No se ha podido eliminar el alerta"
    end
  end

  private

  def alert_params
    params.require(:alert).permit(:name_of_alert)
  end
end
