class UserJourneyAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :user_journey_piece
  has_one :question, through: :answer

  has_one :piece, through: :user_journey_piece
end
