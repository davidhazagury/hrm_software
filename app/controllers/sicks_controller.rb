class SicksController < ApplicationController
  def index
    @worker = Worker.find(params[:worker_id])
    @sicks = policy_scope(Sick.where('worker_id = ?', params[:worker_id]))
  end

  def new
    @worker = Worker.find(params[:worker_id])
    @sick = Sick.new()
    authorize @sick
  end

  def create
    @worker = Worker.find(params[:worker_id])
    @sick = Sick.new(sick_params)
    @sick.worker = @worker
    authorize @sick
    if @sick.save
      redirect_to worker_sicks_path(@worker), notice: "Permiso creado correctamente"
    else
      render :new, alert: 'Revisar errores'
    end
  end

  def edit
    @worker = Worker.find(params[:worker_id])
    @sick = Sick.find(params[:id])
    authorize @sick
  end

  def update
    @worker = Worker.find(params[:worker_id])
    @sick = Sick.find(params[:id])
    authorize @sick
    if @sick.update(sick_params)
      redirect_to worker_sicks_path(@worker), notice: "Permiso actualizado correctamente"
    else
      render :edit, alert: "Revisar errores."
    end
  end

  private

  def sick_params
    params.require(:sick).permit(:rejoin_note_sickeness, :comment,
                                 :start_date_sickness, :rejoin_date_sickness,
                                 :doctor_note_sickeness, :worker_id, :type_of_sickness)
  end
end
