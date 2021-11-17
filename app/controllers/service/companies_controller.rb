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
      # Create a bucket for eac company that sign's up. When do we create it? when the user is confirmed? When the company is created?
      #c = Aws::S3::Client.new(region: 'eu-west-1', access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['SECRET_ACCESS_KEY'])
      # bucket_name = "#{@company.name_of_company.parameterize}-#{@company.id}"
      #c.create_bucket(bucket: bucket_name)
      # MAKE THE BUCKET BLOCK ALL PUBLIC!
      # USE CREATE BUCKET METHOD IN THIS WEB: https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/s3-example-create-buckets.html
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
