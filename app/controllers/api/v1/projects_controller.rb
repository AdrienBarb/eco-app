
class Api::V1::ProjectsController < Api::V1::ApplicationController


  before_action :set_user, only: [:new, :create, :edit, :update, :edit_roles, :destroy, :upvote]
  before_action :set_project, only: [:show, :edit, :update, :edit_roles, :update_roles, :destroy, :upvote]


  def index
    @projects = policy_scope(Project)
    render json: @projects
  end

  def show
    authorize @project, :show?
    render json: @project
  end

  def create
    @project = @user.project.build(project_params)
    authorize @project, :create?
    if @project.save
      Role.create(role: 'manager', user: @user, project: @project)
      render json: @project
    else
      render json: { error: "Votre projet n'a pas été crée" }, status: 422
    end
  end

  def update
    authorize @project, :update?
    if @project.update(project_params)
      render json: @project
    else
      render json: { error: "Votre projet n'a pas été modifié" }, status: 422
    end
  end

  def destroy
    authorize @project, :destroy?
    if @project.destroy
      head :no_content
    else
      render json: { error: "Votre projet n'a pas été suprimé" }, status: 422
    end
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
    head(:created)
  end

  def upvote
    authorize @project, :upvote?
    @vote = @project.votes.build(user: @user)
    unless Vote.find_by(user: @user, project: @project).nil?
      render json: { error: "Vous avez deja voté" }, status: 422
    else
      @vote.save!
      head(:created)
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
    params.require(:project).permit(:name, :description, :website_url, :linkedin_url, :twitter_url, :facebook_url, :instagram_url, :category_id, :tag_names)
  end
end
