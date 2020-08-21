class Api::V1::CommentsController < Api::V1::ApplicationController
  before_action :set_user, only: [:create]
  before_action :set_project, only: [:create]
  respond_to :json


  def create
    @comment = @project.comments.build(comment_params)
    @comment.user = @user
    if @comment.save
      render json: @comment
    else
      render json: { error: "Votre commentaire n'a pas pu étre créé" }, status: 422
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
