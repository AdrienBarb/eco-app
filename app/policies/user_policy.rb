class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def edit?
    user || user.try(:admin?)
  end

  def update?
    edit?
  end
end
