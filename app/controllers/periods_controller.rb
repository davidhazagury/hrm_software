class PeriodsController < ApplicationController
  before_action :check_period, on: :create

  def new
    @period = Period.new()
    authorize @period
  end

  def create
    @period = Period.new(period_params)
    authorize @period
    if @period.save!
      redirect_to workers_path, notice: "Periodo creado correctamente"
    else
      render :new, alert: 'No se ha podido crear el periodo'
    end
  end

  private

  def period_params
    params.require(:period).permit(:year)
  end

  def check_period
    # This method checks if user is creating a period that has already being created. (Years can not be repeated)
    # Period model has already a uniqueness validation, but we want to add a second validation
    # .pluck returns only the column year
    periods = Period.pluck(:year)
    if periods.include? (self.params[:period][:year])
      redirect_to workers_path, alert: "#{self.params[:period][:year]} ya ha sido creado"
    end
  end
end
