class UserJourney < ApplicationRecord
  belongs_to :journey
  belongs_to :user

  has_many :pieces, throught: :journey
  has_many :user_journey_answers

end
