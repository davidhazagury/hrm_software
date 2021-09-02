class Administrator::DepartmentsController < ApplicationController
  def index
    @departments = policy_scope([:administrator,Department.order(:name_of_department)])
  end
  def new
    @department = Department.new
    authorize [:administrator, @department]
  end

  def create
    @department = Department.new(department_params)
    authorize [:administrator, @department]
    if @department.save
      redirect_to administrator_departments_path, notice: "Departmento creado correctamente."
    else
      render :new
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
      redirect_to administrator_departments_path, notice: "Departmento actualizado correctamente."
    else
      render :edit
    end
  end

  def destroy
    @department = Department.find(params[:id])
    authorize [:administrator, @department]
    if @department.destroy
      redirect_to administrator_departments_path, notice: "Departmento elimanado correctamente."
    else
      redirect_to administrator_departments_path, alert: "No se ha podido eliminar el departmento"
    end
  end

  private

  def department_params
    params.require(:department).permit(:name_of_department)
  end
end
