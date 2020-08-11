class CommentsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :set_project, only: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @comment = @project.comments.build
    authorize @comment, :new?
  end

  def create
    @comment = @project.comments.build(comment_params)
    @comment.user = @user
    authorize @comment, :create?
    if @comment.save
      flash[:notice] = "Votre commentaire a bien été créé !"
      redirect_to project_path(@project)
    else
      flash[:alert] = "Votre commentaire n'a pu être créé !"
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
