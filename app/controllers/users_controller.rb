class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Vous informations ont bien été modifiés"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Vous informations n'ont pas été modifiés"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:title, :description)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
