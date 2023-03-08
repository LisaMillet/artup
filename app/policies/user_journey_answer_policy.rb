class UserJourneyAnswerPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def show?
    true
  end

  def create?
    true
  end
end
