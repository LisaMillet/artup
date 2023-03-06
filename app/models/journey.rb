class Journey < ApplicationRecord
  has_many :user_journeys, dependent: :destroy
  has_many :journey_pieces, dependent: :destroy
end
