class RequestPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    record.buddy == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
