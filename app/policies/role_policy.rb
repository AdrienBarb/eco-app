class RolePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user.try(:admin?) || record.roles.exists?(user_id: user, role: 'manager')
  end

  def create?
    user.try(:admin?) || record.roles.exists?(user_id: user, role: 'manager')
  end

  def edit?
    user.try(:admin?) || record.roles.exists?(user_id: user, role: 'manager')
  end

  def update?
    user.try(:admin?) || record.roles.exists?(user_id: user, role: 'manager')
  end
end
