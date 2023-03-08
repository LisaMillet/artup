class UserJourneyPiece < ApplicationRecord
  belongs_to :user_journey
  belongs_to :piece
  has_one :user, through: :user_journey

  enum status: [:locked, :waiting_for_answer, :revealed]
end
