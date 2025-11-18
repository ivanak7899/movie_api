class PersonPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

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
