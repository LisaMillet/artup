class UserJourneyPiece < ApplicationRecord
  belongs_to :user_journey
  belongs_to :piece

  enum status: [:locked, :waiting_for_answer, :revealed]
end
