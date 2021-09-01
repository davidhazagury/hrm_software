class Administrator::AreasController < ApplicationController
    def index
      @areas = policy_scope([:administrator,Area.order(:type_of_area)])
    end
    def new
      @area = Area.new
      authorize [:administrator, @area]
    end

    def create
      @area = Area.new(area_params)
      authorize [:administrator, @area]
      if @area.save
        redirect_to administrator_areas_path, notice: "Area creada correctamente."
      else
        render :new
      end
    end
    def edit
      @area = Area.find(params[:id])
      authorize [:administrator, @area]
    end

    def update
      @area = Area.find(params[:id])
      authorize [:administrator, @area]
      if @area.update(area_params)
        redirect_to administrator_areas_path, notice: "Area actualizada correctamente."
      else
        render :edit
      end
    end

    def destroy
      @area = Area.find(params[:id])
      authorize [:administrator, @area]
      if @area.destroy
        redirect_to administrator_areas_path, notice: "Elimanada correctamente."
      else
        redirect_to administrator_areas_path, alert: "No se ha podido eliminar la baja."
      end
    end

    private

    def area_params
      params.require(:area).permit(:type_of_area)
    end
end
