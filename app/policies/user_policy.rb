class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    return true if user.admin?

    record.id == user.id
  end

  def update?
    show?
  end

  def destroy?
    show?
  end

  class Scope < Scope
    def resolve
      user.admin? ? scope.all : scope.where(id: user.id)
    end
  end
end
