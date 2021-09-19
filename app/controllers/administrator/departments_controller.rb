class Administrator::DepartmentsController < ApplicationController

  def index
    @departments = policy_scope([:administrator, Department.order(:name_of_department)])
  end

  def new
    @department = Department.new
    authorize [:administrator, @department]
  end

  def create
    @department = Department.new(department_params)
    authorize [:administrator, @department]
    if @department.save
      redirect_to administrator_departments_path, notice: t('admin.department.create.notice')
    else
      render :new, alert: t('admin.department.create.alert')
    end
  end

  def edit
    @department = Department.find(params[:id])
    authorize [:administrator, @department]
  end

  def update
    @department = Department.find(params[:id])
    authorize [:administrator, @department]
    if @department.update(department_params)
      redirect_to administrator_departments_path, notice: t('admin.department.update.notice')
    else
      render :edit, t('admin.department.update.alert')
    end
  end

  def destroy
    @department = Department.find(params[:id])
    authorize [:administrator, @department]
    if @department.destroy
      redirect_to administrator_departments_path, notice: t('admin.department.destroy.notice')
    else
      redirect_to administrator_departments_path, alert: t('admin.department.destroy.alert')
    end
  end

  private

  def department_params
    params.require(:department).permit(:name_of_department)
  end
end
