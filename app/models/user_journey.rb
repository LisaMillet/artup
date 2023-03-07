class UserJourney < ApplicationRecord
  belongs_to :journey
  belongs_to :user

  has_many :pieces, through: :journey
  has_many :user_journey_answers

  def answered_pieces
    user_journey_answers.map do |user_journey_answer|
      user_journey_answer.piece
    end
  end

  def next_piece
    pieces_left = pieces.reject do |piece|
      answered_pieces.include?(piece)
    end
    pieces_left.first
  end

end
