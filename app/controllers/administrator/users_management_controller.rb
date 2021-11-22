class Administrator::UsersManagementController < ApplicationController
  # Pundit is a model based authorization gem. We can not use it this controller, because it doesn't have a model associated to it.
  # That's why we need to callback this function, to make sure ONLY Site admins can CRUD users.
  before_action :check_if_user_is_admin
  after_action :send_welcome_email_to_user, only: [:create]
  before_action :destroy_assignments_associated_to_user, only: [:destroy]
  def index
    @users = User.where(company_id: current_user.company_id)
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    @user.password = @user.set_users_password
    if @user.save
      redirect_to administrator_users_path, notice: t('admin.user_management.create.notice')
    else
      render :new, t('admin.user_management.create.alert')
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to administrator_users_path, notice: t('admin.user_management.destroy.notice')
    else
      render :index, alert: t('admin.user_management.destroy.alert')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to administrator_users_path, notice: t('admin.user_management.update.notice')
    else
      render :edit, alert: t('admin.user_management.update.alert')
    end
  end

  private

  def check_if_user_is_admin
    # Only admins can CRUD users.user
    if !current_user.role? :admin
      redirect_to root_path, warning: t('admin.user_management.check_if_user_is_admin.warning')
    end
  end

  def send_welcome_email_to_user
    # AFTE CREATING A USER AN EMAIL WELCOMING HIM/HER WITH HIS/HER PASSWORD WILL BE SEND!
  end

  def destroy_assignments_associated_to_user
    # Due to the N:N association, we need first to delete the associtions of the user before deleting the user
    @user = User.find(params[:id])
    @user.assignments.destroy_all
    @user.assign_email_notifications.destroy_all
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, role_ids:[])
  end
end
