class Piece < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :journey_pieces, dependent: :destroy
end
