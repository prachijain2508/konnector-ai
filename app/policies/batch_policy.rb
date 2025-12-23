class BatchPolicy < ApplicationPolicy
  def create?
    user.school_admin?
  end

  def update?
    user.school_admin? && record.course.school_id == user.school_id
  end
  
  def approve_enrollment?
    update?
  end
end