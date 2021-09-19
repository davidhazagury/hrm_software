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
      redirect_to administrator_work_centers_path, notice: t('admin.work_center.create.notice')
    else
      render :new, alert: t('admin.work_center.create.alert')
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
      redirect_to administrator_work_centers_path, notice: t('admin.work_center.update.notice')
    else
      render :edit, alert: t('admin.work_center.update.alert')
    end
  end

  def destroy
    @work_center = WorkCenter.find(params[:id])
    authorize [:administrator, @work_center]
    if @work_center.destroy
      redirect_to administrator_work_centers_path, notice: t('admin.work_center.destroy.notice')
    else
      redirect_to administrator_work_centers_path, alert: t('admin.work_center.destroy.alert')
    end
  end

  private

  def work_center_params
    params.require(:work_center).permit(:name_of_work_center)
  end
end
