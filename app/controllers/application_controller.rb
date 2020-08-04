class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  after_action :verify_authorized, except: [:index], unless: :devise_controller?
  after_action :verify_policy_scoped, only: [:index], unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def not_authorized
    redirect_to root_path, alert: "You aren't allowed to do that."
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :city, :zip_code, :country, :url_linkedin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :city, :zip_code, :country, :url_linkedin])
  end
end


