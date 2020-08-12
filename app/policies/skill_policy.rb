class SkillPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    true
  end

  def create?
    :new?
  end

  def edit?
    true
  end

  def update?
    :edit?
  end

  def destroy?
    true
  end
end
