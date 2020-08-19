class Api::V1::ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def current_user
    User.find(payload['user_id'])
  end

  def payload
    WebToken.decode(get_token)
  end

  def get_token
    auth_header.present? && auth_header.split(' ').last
  end

  def auth_header
    request.headers['Authorization']
  end

end
