class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:show, :archive]

  def index
    @users = User.excluding_archived
  end

  def show
  end

  def archive
    if @user == current_user
      flash[:alert] = "Vous ne pouvez pas vous archiver vous même"
    else
      @user.archive
      flash[:notice] = "L'utilisateur a bien été archivé"
    end
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
