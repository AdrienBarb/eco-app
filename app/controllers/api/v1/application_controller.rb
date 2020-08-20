class Api::V1::ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
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

end
