class Administrator::UsersManagementController < ApplicationController
  # Pundit is a model based authorization gem. We can not use it this controller, because it doesn't have a model associated to it.
  # That's why we need to callback this function, to make sure ONLY Site admins can CRUD users.
  before_action :check_if_user_is_admin
  def index
    @users = User.all
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    raise
  end

  private

  def check_if_user_is_admin
    if !current_user.role? :admin
      redirect_to root_path, alert: 'No tienes autorización para acceder a este espacio.'
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
