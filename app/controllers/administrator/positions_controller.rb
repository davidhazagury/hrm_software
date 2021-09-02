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
      redirect_to administrator_positions_path, notice: "Posición creada correctamente."
    else
      render :new, alert: 'Ha habido un error'
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
      redirect_to administrator_positions_path, notice: "Posición actualizada correctamente."
    else
      render :edit, alert: 'Ha habido un error'
    end
  end

  private

  def position_params
    params.require(:position).permit(:name_of_position)
  end
end
