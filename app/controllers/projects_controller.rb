class ProjectsController < ApplicationController
  before_action :set_user

  def index
  end

  def show
  end

  def new
    @project = @user.project.build
  end

  def create
    @project = @user.project.build(project_params)
    if @project.save!
      flash[:notice] = "Votre projet a bien été crée !"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Votre projet n'a pas été crée"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :category, :website_url, :linkedin_url, :twitter_url, :facebook_url, :instagram_url)
  end
end
