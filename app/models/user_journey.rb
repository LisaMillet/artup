class UserJourney < ApplicationRecord
  belongs_to :journey
  belongs_to :user

  has_many :user_journey_pieces
  has_many :pieces, through: :user_journey_pieces
  has_many :user_journey_answers, through: :user_journey_pieces

  after_create :create_user_journey_pieces

  # def answered_pieces
  #   user_journey_pieces.
  #   user_journey_answers.map do |user_journey_answer|
  #     user_journey_answer.piece
  #   end
  # end

  def next_user_journey_piece
    user_journey_pieces.locked.first
    # pieces_left = pieces.reject do |piece|
    #   answered_pieces.include?(piece)
    # end
    # pieces_left.first
  end

  private

  def create_user_journey_pieces
    journey.pieces.each do |piece|
      UserJourneyPiece.create(piece: piece, user_journey: self, status: piece.status)
    end
  end

end
