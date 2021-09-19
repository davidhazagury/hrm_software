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
      redirect_to administrator_type_of_shifts_path, notice: t('admin.type_of_shift.create.notice')
    else
      render :new, t('admin.type_of_shift.create.alert')
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
      redirect_to administrator_type_of_shifts_path, notice: t('admin.type_of_shift.update.notice')
    else
      render :edit, alert: t('admin.type_of_shift.update.alert')
    end
  end

  def destroy
    @type_of_shift = TypeOfShift.find(params[:id])
    authorize [:administrator, @type_of_shift]
    if @type_of_shift.destroy
      redirect_to administrator_type_of_shifts_path, notice: t('admin.type_of_shift.destroy.notice')
    else
      redirect_to administrator_type_of_shifts_path, alert: t('admin.type_of_shift.destroy.alert')
    end
  end

  private

  def shift_params
    params.require(:type_of_shift).permit(:name_of_shift)
  end
end
