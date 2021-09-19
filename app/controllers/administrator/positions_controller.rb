class Administrator::PositionsController < ApplicationController
  def index
    @positions = policy_scope([:administrator, Position.order(:name_of_position)])
  end

  def new
    @position = Position.new
    authorize [:administrator, @position]
  end

  def create
    @position = Position.new(position_params)
    authorize [:administrator, @position]
    if @position.save
      redirect_to administrator_positions_path, notice: t('admin.position.create.notice')
    else
      render :new, alert: t('admin.position.create.alert')
    end
  end

  def edit
    @position = Position.find(params[:id])
    authorize [:administrator, @position]
  end

  def update
    @position = Position.find(params[:id])
    authorize [:administrator, @position]
    if @position.update(position_params)
      redirect_to administrator_positions_path, notice: t('admin.position.update.notice')
    else
      render :edit, alert: t('admin.position.update.alert')
    end
  end

  private

  def position_params
    params.require(:position).permit(:name_of_position)
  end
end
