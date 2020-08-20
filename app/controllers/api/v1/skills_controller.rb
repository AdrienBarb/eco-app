class Api::V1::SkillsController < Api::V1::ApplicationController

  before_action :set_user, only: [:index, :new, :create, :edit, :update, :destroy, :recommend]
  before_action :set_skill, only: [:edit, :update, :destroy, :recommend]


  def index
    @skills = Skill.where(user: @user)
    render json: @skills
  end


  def create
    @skill = @user.skills.build(skills_params)
    if @skill.save
      render json: @skill
    else
      render json: { error: "Votre compétence n'a pas été ajoutée" }, status: 422
    end
  end


  def update
    if @skill.update(skills_params)
      render json: @skill
    else
      render json: { error: "Votre compétence n'a pas pu être ajoutée"}, status: 422
    end
  end

  def destroy
    @skill.destroy
    head :no_content
  end

  def recommend
    @recommendation = @skill.recommendations.build(user: @user)
    unless Recommendation.find_by(user: @user, skill: @skill).nil?
      render json: { error: "Vous ne pouvez pas recommender une compétences 2 fois" }, status: 422
    else
      @recommendation.save
      head :created
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skills_params
    params.require(:skill).permit(:title, :description, :rate)
  end
end
