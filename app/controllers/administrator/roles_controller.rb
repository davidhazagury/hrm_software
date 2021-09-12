class Administrator::RolesController < ApplicationController
  def index
    @roles = policy_scope([:administrator,Role.order(:role_name)])
  end
  def new
    @role = Role.new
    authorize [:administrator, @role]
  end

  def create
    @role = Role.new(role_params)
    authorize [:administrator, @role]
    if @role.save
      redirect_to administrator_roles_path, notice: "Rol creado correctamente."
    else
      render :new
    end
  end
  def edit
    @role = Role.find(params[:id])
    authorize [:administrator, @role]
  end

  def update
    @role = Role.find(params[:id])
    authorize [:administrator, @role]
    if @role.update(role_params)
      redirect_to administrator_roles_path, notice: "Rol actualizado correctamente."
    else
      render :edit
    end
  end

  def destroy
    @role = Role.find(params[:id])
    authorize [:administrator, @role]
    if @role.destroy
      redirect_to administrator_roles_path, notice: "Rol elimanado correctamente."
    else
      redirect_to administrator_roles_path, alert: "No se ha podido eliminar el role"
    end
  end

  private

  def role_params
    params.require(:role).permit(:role_name)
  end
end
