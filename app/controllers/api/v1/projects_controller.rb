class Api::V1::ProjectsController < Api::V1::ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!


  before_action :set_user, only: [:new, :create, :edit, :update, :edit_roles, :destroy, :upvote]
  before_action :set_project, only: [:show, :edit, :update, :edit_roles, :update_roles, :destroy, :upvote]


  def index
    projects = Project.search((params[:q].present? ? params[:q] : '*')).records
    render json: projects
  end

  def show
    authorize @project, :show?
    render json: @project
  end

  def create
    @project = @user.project.build(project_params)
    binding.pry
    if @project.save
      Role.create(role: 'manager', user: @user, project: @project)
      render json: @project
    else
      render json: { error: "Votre projet n'a pas été crée" }, status: 422
    end
  end

  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: { error: "Votre projet n'a pas été modifié" }, status: 422
    end
  end

  def destroy
    if @project.destroy
      head :no_content
    else
      render json: { error: "Votre projet n'a pas été suprimé" }, status: 422
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def set_user
      @user = current_user
      binding.pry
    end

    def project_params
      params.require(:project).permit(:name, :description, :website_url, :linkedin_url, :twitter_url, :facebook_url, :instagram_url, :category_id, :tag_names)
    end

    def payload
      WebToken.decode(get_token)
    end

    def get_token
      auth_header.present? && auth_header.split(' ').last
    end

    def auth_header
      request.headers['Authorization']
    end

end
