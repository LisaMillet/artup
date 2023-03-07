class UserJourneyPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def show?
    record.user == user
  end

  def create?
    true
  end

end
