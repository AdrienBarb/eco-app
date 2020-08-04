class ProjectsController < ApplicationController
  before_action :set_user, only: [:new, :create, :edit, :update, :edit_roles, :destroy]
  before_action :set_project, only: [:show, :edit, :update, :edit_roles, :update_roles, :destroy]

  def index
    @projects = policy_scope(Project)
  end

  def show
    authorize @project, :show?
  end

  def new
    @project = @user.project.build
    @categories = Category.all
  end

  def create
    authorize @project, :update?
    @project = @user.project.build(project_params)
    if @project.save
      flash[:notice] = "Votre projet a bien été crée !"
      redirect_to project_path(@project)
    else
      flash[:alert] = "Votre projet n'a pas été crée"
      render :new
    end
  end

  def edit
    authorize @project, :update?
    @categories = Category.all
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Votre projet a bien été modifié !"
      redirect_to project_path(@project)
    else
      flash[:alert] = "Votre projet n'a pas été modifié !"
      render :edit
    end
  end

  def destroy
    authorize @project, :destroy?
    @project.destroy
    flash[:notice] = "Votre projet a bien été supprimé !"
    redirect_to user_path(@user)
  end

  def edit_roles
    authorize @project, :edit_roles?
    @users = @project.users
  end

  def update_roles
    @user = User.find(params[:user_id])
    role_data = params.fetch(:roles, [])
    puts params
    puts '_________________'
    puts role_data
    role_data.each do |project_id, role_name|
      if role_name.present?
        @user.roles.build(project_id: project_id, role: role_name)
      end
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def project_params
    params.require(:project).permit(:name, :description, :website_url, :linkedin_url, :twitter_url, :facebook_url, :instagram_url, :category_id)
  end
end
