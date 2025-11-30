class PersonPolicy < ApplicationPolicy
  def create?
    user.moderator? || user.admin?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
