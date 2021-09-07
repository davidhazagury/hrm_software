class Administrator::UsersManagementController < ApplicationController
  # Pundit is a model based authorization gem. We can not use it this controller, because it doesn't have a model associated to it.
  # That's why we need to callback this function, to make sure ONLY Site admins can CRUD users.
  before_action :check_if_user_is_admin
  after_action :send_welcome_email_to_user, only: [:create]
  def index
    @users = User.all
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    @user.password = @user.set_users_password
    if @user.save
      redirect_to administrator_users_path, notice: 'Usuario creado correctamente'
    else
      render :new
    end
  end

  private

  def check_if_user_is_admin
    # Only admins can CRUD users.user
    if !current_user.role? :admin
      redirect_to root_path, alert: 'No tienes autorización para acceder a este espacio.'
    end
  end

  def send_welcome_email_to_user
    # AFTE CREATING A USER AN EMAIL WELCOMING HIM/HER WITH HIS/HER PASSWORD WILL BE SEND!
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, role_ids:[])
  end
end
