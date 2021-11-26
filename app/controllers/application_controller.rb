class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Before any action, we check if the company has a trial period activated
  before_action :has_free_trial_activated?, if: :current_user
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale == I18n.default_locale ? nil : I18n.locale}
  end

private

  def has_free_trial_activated?
    if DateTime.now > current_user.company.trial_ended_at
      render template: 'service/pages/welcome'
    end
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    request.referrer.nil? ? root_path : redirect_to(request.referrer)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
