class WorkersController < ApplicationController
  def index
    @workers = policy_scope(Worker.all)
  end

  def new
    @worker = Worker.new()
    authorize @worker
  end

  def create
    @worker = Worker.new(worker_params)
    authorize @worker
    @worker.set_company_and_work_center
    if @worker.save
      redirect_to worker_path(@worker), notice: "#{@worker.first_name} creado correctamente"
    else
      render :new, alert: 'Revisar errores'
    end
  end

  def show
    @worker = Worker.find(params[:id])
    authorize @worker
  end

  def edit
    @worker = Worker.find(params[:id])
    authorize @worker
  end

  def update
    @worker = Worker.find(params[:id])
    authorize @worker
    if @worker.update!(worker_params)
      redirect_to worker_path(@worker), notice: "#{@worker.first_name} actualizado correctamente"
    else
      render :edit, alert: "Revisar errores."
    end
  end

  private

  def worker_params
    params.require(:worker).permit(:first_name, :last_name, :birth_date, :start_date,
                                   :department_id, :sin_num, :personal_email, :ga_email,
                                   :id_num, :type_of_contract_id, :genre_id, :phone_number,
                                   :bank_account, :type_of_shift_id, :position_id, :group_id,
                                   :level_id, :area_id, :trial_period, :notice_period,
                                   :annual_salary, :avatar)
  end
end
