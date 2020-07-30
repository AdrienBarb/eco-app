class ProjectsController < ApplicationController
  before_action :set_user
  before_action :set_project, only: [:show, :edit, :update, :destroy]

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
      redirect_to user_project_path(@user, @project)
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

  def set_project
    @project = Project.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :category, :website_url, :linkedin_url, :twitter_url, :facebook_url, :instagram_url)
  end
end
