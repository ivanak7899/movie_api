class ReviewPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id
  end

  def destroy?
    user.admin? || user.moderator? || record.user_id == user.id
  end
end
