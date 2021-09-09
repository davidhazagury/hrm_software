class PagesController < ApplicationController
  def home
    if (current_user) && (current_user.role? :admin)
      redirect_to administrator_users_path, notice: "Hola de nuevo #{current_user.first_name} 😊"
    elsif (current_user) && (!current_user.role? :admin)
      redirect_to workers_path, notice: "Hola de nuevo #{current_user.first_name} 😊"
    else
      redirect_to root_path
    end
  end
end
