class Administrator::TypeOfShiftsController < ApplicationController
  def index
    @type_of_shifts = policy_scope([:administrator, TypeOfShift.order(:name_of_shift)])
  end

  def new
    @type_of_shift = TypeOfShift.new
    authorize [:administrator, @type_of_shift]
  end

  def create
    @type_of_shift = TypeOfShift.new(shift_params)
    authorize [:administrator, @type_of_shift]
    if @type_of_shift.save
      redirect_to administrator_type_of_shifts_path, notice: "Turno creado correctamente."
    else
      render :new
    end
  end

  def edit
    @type_of_shift = TypeOfShift.find(params[:id])
    authorize [:administrator, @type_of_shift]
  end

  def update
    @type_of_shift = TypeOfShift.find(params[:id])
    authorize [:administrator, @type_of_shift]
    if @type_of_shift.update(shift_params)
      redirect_to administrator_type_of_shifts_path, notice: "Turno actualizado correctamente."
    else
      render :edit
    end
  end

  def destroy
    @type_of_shift = TypeOfShift.find(params[:id])
    authorize [:administrator, @type_of_shift]
    if @type_of_shift.destroy
      redirect_to administrator_type_of_shifts_path, notice: "Turno elimanado correctamente."
    else
      redirect_to administrator_type_of_shifts_path, alert: "No se ha podido eliminar el turno"
    end
  end

  private

  def shift_params
    params.require(:type_of_shift).permit(:name_of_shift)
  end
end
