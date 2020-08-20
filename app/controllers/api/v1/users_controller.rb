class Api::V1::UsersController < Api::V1::ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { error: "Vos informations n'ont pas été modifiées" }, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:title, :description, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
