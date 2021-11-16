class Service::CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
  def new
    skip_authorization
  end
end
