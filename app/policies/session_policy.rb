class SessionPolicy < ApplicationPolicy
  def show?
    record.user_id == user.id
  end

  def destroy?
    show?
  end

  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end
end
