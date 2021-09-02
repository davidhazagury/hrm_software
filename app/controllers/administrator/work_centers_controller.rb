class Administrator::WorkCentersController < ApplicationController
  def index
    @work_centers = policy_scope([:administrator,WorkCenter.order(:name_of_work_center)])
  end
  def new
    @work_center = WorkCenter.new
    authorize [:administrator, @work_center]
  end

  def create
    @work_center = WorkCenter.new(work_center_params)
    authorize [:administrator, @work_center]
    if @work_center.save
      redirect_to administrator_work_centers_path, notice: "Centro de trabajo creada correctamente."
    else
      render :new
    end
  end

  def edit
    @work_center = WorkCenter.find(params[:id])
    authorize [:administrator, @work_center]
  end

  def update
    @work_center = WorkCenter.find(params[:id])
    authorize [:administrator, @work_center]
    if @work_center.update(work_center_params)
      redirect_to administrator_work_centers_path, notice: "Centro de trabajo actualizada correctamente."
    else
      render :edit
    end
  end

  def destroy
    @work_center = WorkCenter.find(params[:id])
    authorize [:administrator, @work_center]
    if @work_center.destroy
      redirect_to administrator_work_centers_path, notice: "Centro de trabajo elimanada correctamente."
    else
      redirect_to administrator_work_centers_path, alert: "No se ha podido eliminar el centro de trabajo"
    end
  end

  private

  def work_center_params
    params.require(:work_center).permit(:name_of_work_center)
  end
end
