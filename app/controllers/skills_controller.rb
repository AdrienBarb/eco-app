class SkillsController < ApplicationController

  before_action :set_user, only: [:new, :create, :edit, :update, :destroy, :recommend]
  before_action :set_skill, only: [:edit, :update, :destroy, :recommend]


  def index
    @skills = policy_scope(Skill)
    authorize @skills, :index?
  end

  def new
    @skill = @user.skills.build
    authorize @skill, :new?
  end

  def create
    @skill = @user.skills.build(skills_params)
    @skill.ability = create_ability(params[:skill][:title])
    authorize @skill, :create?
    if @skill.save
      flash[:notice] = "Votre compétence a bien été crée !"
      redirect_to skills_path
    else
      flash[:alert] = "Votre compétence n'a pas bien été crée !"
      render :new
    end
  end

  def edit
    authorize @skill, :edit?
  end

  def update
    authorize @skill, :update?
    if @skill.update(skills_params)
      flash[:notice] = "Votre compétence a bien été modifiée"
      redirect_to skills_path
    else
      flash[:alert] = "Votre compétence n'a pas bien été modifiée"
      render :edit
    end
  end

  def destroy
    authorize @skill, :destroy?
    @skill.destroy
    flash[:notice] = 'Votre compétence a bien été suprimée'
    redirect_to skills_path
  end

  def recommend
    authorize @skill, :recommend?
    @recommendation = @skill.recommendations.build(user: @user)
    unless Recommendation.find_by(user: @user, skill: @skill).nil?
      flash[:alert] = "Vous ne pouvez pas recommender une compétences 2 fois"
    else
      @recommendation.save!
    end
    redirect_to user_path(@skill.user)
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

  def create_ability(ability_params)
    ability = ability_params.capitalize
    Ability.find_or_initialize_by(name: ability)
  end
end
