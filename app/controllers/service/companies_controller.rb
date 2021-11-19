class Service::CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    skip_authorization
    @company = Company.new
  end

  def create
    skip_authorization
    @company = Company.new(company_params)
    if @company.save
      # SEND EMAIL CONFIRMATION DEVISE CONFIRMATION!
      @user = User.new(first_name: @company.first_name_company_contact, last_name: @company.last_name_company_contact, email: @company.email_company_contact, role_ids:[1], company_id: @company.id)
      @user.save!
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:email_company_contact, :first_name_company_contact, :last_name_company_contact, :phone_company_contact,
                                    :number_of_employees_company, :name_of_company)
  end
end
