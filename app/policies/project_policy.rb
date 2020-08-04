class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
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
end
