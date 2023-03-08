class Piece < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :journey_pieces, dependent: :destroy
  has_many :user_journey_pieces, dependent: :destroy

  enum status: [:locked, :waiting_for_answer]
  has_one_attached :photo
end
