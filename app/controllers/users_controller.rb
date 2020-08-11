class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = policy_scope(User)
  end

  def show
    authorize @user, :show?
    @projects = Project.where(user: @user)
  end

  def edit
    authorize @user, :edit?
  end

  def update
    authorize @user, :update?
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
    params.require(:user).permit(:title, :description, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
