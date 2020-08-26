class ProjectsController < ApplicationController
  before_action :set_user, only: [:new, :create, :edit, :update, :edit_roles, :destroy, :upvote]
  before_action :set_project, only: [:show, :edit, :update, :edit_roles, :update_roles, :destroy, :upvote]
  skip_after_action :verify_authorized, :verify_policy_scoped, only: [:search, :index]
  before_action :authenticate_user!, only: [:upvote]

  def index
    @projects = policy_scope(Project)
    @projects = Project.filter_by_category(params[:c]) if params[:c].present?

    @categories = Category.all

  end

  def show
    authorize @project, :show?
  end

  def new
    @project = @user.project.build
    authorize @project, :new?
    @categories = Category.all
  end

  def create
    @project = @user.project.build(project_params)
    authorize @project, :create?
    if @project.save
      Role.create(role: 'manager', user: @user, project: @project)
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
    authorize @project, :update?
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
    authorize @project, :update_roles?
    @users = @project.users
  end

  def update_roles
    authorize @project, :update_roles?
    role_data = params.fetch(:roles, [])
    role_data.each do |user_id, role_name|
      if role_name.present?
        Role.find_by(user_id: user_id).delete
        @role = Role.new(user_id: user_id, project: @project, role: role_name)
        @role.save!
      end
    end
    flash[:notice] = "Les roles ont bien été modifié"
    redirect_to project_path(@project)
  end

  def search
    if params[:q].present?
      @projects = Project.search(params[:q]).records
      render "projects/index"
    end
  end

  def upvote
    authorize @project, :upvote?
    @vote = @project.votes.build(user: @user)
    unless Vote.find_by(user: @user, project: @project).nil?
      flash[:alert] = "Vous avez déja voté !"
    else
      @vote.save!
    end
    redirect_to project_path(@project)
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def project_params
    params.require(:project).permit(:name, :description, :website_url, :linkedin_url, :twitter_url, :facebook_url, :instagram_url, :category_id, :tag_names, images: [])
  end
end
