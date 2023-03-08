class UserJourneyPiecePolicy < ApplicationPolicy
  class Scope < Scope
  end

  def show?
    record.user == user
  end
end
