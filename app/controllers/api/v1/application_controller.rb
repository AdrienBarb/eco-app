class Api::V1::ApplicationController < ActionController::Base
  include Pundit

  skip_before_action :verify_authenticity_token

  after_action :verify_authorized, except: [:index], unless: :devise_controller?
  after_action :verify_policy_scoped, only: [:index], unless: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  before_action :authenticate_user!

  def current_user
    User.find(payload['user_id']) if payload
  end

  def payload
    token = get_token
    return current_user = nil unless token.present?
    WebToken.decode(token)
  end

  def get_token
    auth_header.present? && auth_header.split(' ').last
  end

  def auth_header
    request.headers['Authorization']
  end

  private

  def not_authorized
    render json: { error: "You aren't allowed to do that."}, status: 422
  end

end
