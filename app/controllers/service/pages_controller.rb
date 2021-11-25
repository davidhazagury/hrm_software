class Service::PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :welcome]
  def home
    skip_authorization
  end

  def welcome
    skip_authorization
    raise
  end
end
