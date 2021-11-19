class PasswordsController < Devise::PasswordsController
  private
  def after_resetting_password_path_for(resource)
    sign_in(resource) # In case you want to sign in the user
    workers_path
  end
end
