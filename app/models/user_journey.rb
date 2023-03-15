class UserJourney < ApplicationRecord
  belongs_to :journey
  belongs_to :user

  has_many :user_journey_pieces
  has_many :pieces, through: :user_journey_pieces
  has_many :user_journey_answers, through: :user_journey_pieces
  has_many :answers, through: :user_journey_answers
  has_many :questions, through: :pieces

  after_create :create_user_journey_pieces

  def next_user_journey_piece
    user_journey_pieces.joins(:piece).order(pieces: :asc).where(user_journey_pieces: { status: [:waiting_for_answer, :locked] }).first
  end

  def score
    answers.where(right_answer: true).count
  end

  def discount
    ((((journey.discount / 100) * score) / total_score) * 100).to_i
  end

  def total_score
    pieces.joins(:questions).count
  end

  def revealed?(piece)
    user_journey_pieces.find_by(piece: piece).revealed?
  end

  def number_of_revealed
    user_journey_pieces.revealed.count
  end

  def number_of_pieces
    pieces.count
  end

  def progression
    (100.to_f / questions.count) * answers.count
  end

  private

  def create_user_journey_pieces
    journey.pieces.each do |piece|
      UserJourneyPiece.create(piece: piece, user_journey: self, status: piece.status)
    end
  end
end
