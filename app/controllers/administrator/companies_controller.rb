class Administrator::CompaniesController < ApplicationController
  def index
    @companies = policy_scope(Company.order(:id))
    authorize @companies
  end
  def new
    @company = Company.new
    authorize [:administrator, @company]
  end

  def create
    @company = Company.new(company_params)
     authorize @company
    if @company.save

      redirect_to companies_path, notice: "Compañia creada correctamente."
    else
      render :new, alert: 'Ha habido un error'
    end
  end

  def edit
    @company = Company.find(params[:id])
     authorize @company
  end

  def update
    @company = Company.find(params[:id])
     authorize @company
    if @company.update(company_params)
      redirect_to companies_path, notice: "Compañia actualizada correctamente."
    else
      render :edit, alert: 'Ha habido un error'
    end
  end

  private

  def company_params
    params.require(:company).permit(:name_of_company)
  end
end
