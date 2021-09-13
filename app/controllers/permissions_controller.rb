class PermissionsController < ApplicationController
  def index
    @worker = Worker.find(params[:worker_id])
    @permissions = policy_scope(Permission.where('worker_id = ?', params[:worker_id]))
  end

  def new
    @worker = Worker.find(params[:worker_id])
    @permission = Permission.new()
    authorize @permission
  end

  def create
    @worker = Worker.find(params[:worker_id])
    @permission = Permission.new(permission_params)
    @permission.worker = @worker
    authorize @permission
    if @permission.save
      redirect_to worker_permissions_path(@worker), notice: "Permiso creado correctamente"
    else
      render :new, alert: 'Revisar errores'
    end
  end

  def edit
    @worker = Worker.find(params[:worker_id])
    @permission = Permission.find(params[:id])
    authorize @permission
  end

  def update
    @worker = Worker.find(params[:worker_id])
    @permission = Permission.find(params[:id])
    authorize @permission
    if @permission.update!(permission_params)
      redirect_to worker_permissions_path(@worker), notice: "Permiso actualizado correctamente"
    else
      render :edit, alert: "Revisar errores."
    end
  end

  private

  def permission_params
    params.require(:permission).permit(:note, :comment, :permission_start_date,
                                       :permission_rejoin_date, :worker_id,
                                       :type_of_permission_id)
  end

end
