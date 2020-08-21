class Api::V1::AnswersController < Api::V1::ApplicationController
  before_action :set_user
  before_action :set_comment

  def create
    @answer = @comment.answers.build(answer_params)
    @answer.user = @user
    if @answer.save!
      SendNotification.new(@user, @answer).notify_watchers
      render json: @answer
    else
      render json: { error: "Votre réponses n'a pas été ajoutée" }, status: 422
    end
  end

  puts 'helloo'

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
