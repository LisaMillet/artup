class UserJourneyAnswer < ApplicationRecord
  belongs_to :answer
  has_one :piece, through: :answer
  
  belongs_to :user_journey
end
