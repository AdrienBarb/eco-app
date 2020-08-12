class SkillPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    user
  end

  def new?
    user
  end

  def create?
    :new?
  end

  def edit?
    record.user == user
  end

  def update?
    :edit?
  end

  def destroy?
    record.user == user
  end

  def recommend?
    record.user != user
  end
end
