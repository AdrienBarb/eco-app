class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    :new?
  end

  def show?
    true
  end

  def upvote?
    true
  end

  def update?
    user.try(:admin?) || record.roles.exists?(user_id: user, role: 'manager') || record.roles.exists?(user_id: user, role: 'editor')
  end

  def destroy?
    user.try(:admin?) || record.roles.exists?(user_id: user, role: 'manager')
  end

  def update_roles?
    destroy?
  end

  def tag?
    destroy?
  end
end
