class UserJourneyPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def show?
    record.user == user
  end

  def create?
    true
  end

  def quit?
    record.user == user && record.status == true
  end

end
