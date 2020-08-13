class AnswersController < ApplicationController
  before_action :set_user
  before_action :set_comment
  before_action :authenticate_user!, only: [:new, :create]



  def new
    @answer = @comment.answers.build
    authorize @answer, :new?
  end

  def create
    @answer = @comment.answers.build(answer_params)
    @answer.user = @user
    authorize @answer, :create?
    if @answer.save!
      SendNotification.new(@user, @answer).notify_watchers
      flash[:notice] = "Votre réponse a bien été prise en compte"
      redirect_to project_path(@comment.project)
      puts 'hellooooooooooooooooooooo'
    else
      flash[:alert] = "Votre réponse n'a pas été prise en compte"
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
