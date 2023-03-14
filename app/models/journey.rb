class Journey < ApplicationRecord
  has_many :user_journeys, dependent: :destroy
  has_many :journey_pieces, dependent: :destroy

  has_many :pieces, through: :journey_pieces
  has_many :questions, through: :pieces

  has_one_attached :photo

  def total_score
    pieces.joins(:questions).count
  end
end
