class Administrator::TypeOfPermissionsController < ApplicationController
  def index
    @type_of_permissions = policy_scope([:administrator, TypeOfPermission.order(:name_of_permission)])
  end

  def new
    @type_of_permission = TypeOfPermission.new
    authorize [:administrator, @type_of_permission]
  end

  def create
    @type_of_permission = TypeOfPermission.new(permission_params)
    authorize [:administrator, @type_of_permission]
    if @type_of_permission.save
      redirect_to administrator_type_of_permissions_path, notice: t('admin.type_of_permission.create.notice')
    else
      render :new, t('admin.type_of_permission.create.alert')
    end
  end

  def edit
    @type_of_permission = TypeOfPermission.find(params[:id])
    authorize [:administrator, @type_of_permission]
  end

  def update
    @type_of_permission = TypeOfPermission.find(params[:id])
    authorize [:administrator, @type_of_permission]
    if @type_of_permission.update(permission_params)
      redirect_to administrator_type_of_permissions_path, notice: t('admin.type_of_permission.update.notice')
    else
      render :edit, t('admin.type_of_permission.update.alert')
    end
  end

  def destroy
    @type_of_permission = TypeOfPermission.find(params[:id])
    authorize [:administrator, @type_of_permission]
    if @type_of_permission.destroy
      redirect_to administrator_type_of_permissions_path, notice: t('admin.type_of_permission.destroy.notice')
    else
      redirect_to administrator_type_of_permissions_path, alert: t('admin.type_of_permission.destroy.alert')
    end
  end

  private

  def permission_params
    params.require(:type_of_permission).permit(:name_of_permission)
  end
end
