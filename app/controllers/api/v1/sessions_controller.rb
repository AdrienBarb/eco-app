class Api::V1::SessionsController < Devise::RegistrationsController

  skip_before_action :verify_authenticity_token
  def show
    current_user ? head(:ok) : head(:unauthorized)
  end

  def create
    @user = User.where(email: params[:email]).first

    if @user&.valid_password?(params[:password])

      jwt = WebToken.encode(@user)

      render :create, status: :created, locals: { token: jwt }
    else
      render json: { error: 'invalid_credentials' }, status: :unauthorized
    end
  end

end
