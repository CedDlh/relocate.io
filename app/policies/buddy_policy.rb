class BuddyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index
      record.user == user
    end

    def update?
      record.user == user
      # - record: the restaurant passed to the `authorize` method in controller
      # - user:   the `current_user` signed in with Devise.
    end

    def destroy?
      record.user == user
    end

    def create?
      return true
    end
  end
end