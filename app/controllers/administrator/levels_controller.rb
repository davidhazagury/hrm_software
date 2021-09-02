class Administrator::LevelsController < ApplicationController
  def index
      @levels = policy_scope([:administrator, Level.order(:type_of_level)])
    end
    def new
      @level = Level.new
      authorize [:administrator, @level]
    end

    def create
      @level = Level.new(level_params)
      authorize [:administrator, @level]
      if @level.save
        redirect_to administrator_levels_path, notice: "Nivel creado correctamente."
      else
        render :new
      end
    end
    def edit
      @level = Level.find(params[:id])
      authorize [:administrator, @level]
    end

    def update
      @level = Level.find(params[:id])
      authorize [:administrator, @level]
      if @level.update(level_params)
        redirect_to administrator_levels_path, notice: "Nivel actualizado correctamente."
      else
        render :edit
      end
    end

    def destroy
      @level = Level.find(params[:id])
      authorize [:administrator, @level]
      if @level.destroy
        redirect_to administrator_levels_path, notice: "Nivel elimanado correctamente."
      else
        redirect_to administrator_levels_path, alert: "No se ha podido eliminar el nivel."
      end
    end

    private

    def level_params
      params.require(:level).permit(:type_of_level)
    end
end
