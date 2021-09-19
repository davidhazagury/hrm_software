class Administrator::CompaniesController < ApplicationController

  def index
    @companies = policy_scope([:administrator, Company.order(:name_of_company)])
  end

  def new
    @company = Company.new
    authorize [:administrator, @company]
  end

  def create
    @company = Company.new(company_params)
     authorize [:administrator, @company]
    if @company.save
      redirect_to administrator_companies_path, notice: t('admin.company.create.notice')
    else
      render :new, alert: t('admin.company.create.alert')
    end
  end

  def edit
    @company = Company.find(params[:id])
     authorize [:administrator, @company]
  end

  def update
    @company = Company.find(params[:id])
     authorize [:administrator, @company]
    if @company.update(company_params)
      redirect_to administrator_companies_path, notice: t('admin.company.update.notice')
    else
      render :edit, alert: t('admin.company.update.alert')
    end
  end

  private

  def company_params
    params.require(:company).permit(:name_of_company)
  end
end
