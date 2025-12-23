class SchoolPolicy < ApplicationPolicy
  def create?
    user.admin?
  end

  def update?
    user.admin? || (user.school_admin? && record.users.include?(user))
  end
  
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.school_admin?
        scope.where(id: user.school_id)
      else
        scope.none
      end
    end
  end
end