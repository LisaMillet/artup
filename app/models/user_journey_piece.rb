class UserJourneyPiece < ApplicationRecord
  belongs_to :user_journey
  belongs_to :piece
  has_many :questions, through: :piece
  has_many :user_journey_answers
  has_many :answers, through: :user_journey_answers
  has_many :answered_questions, through: :user_journey_answers, source: :question
  has_one :user, through: :user_journey

  enum status: [:locked, :waiting_for_answer, :revealed]

  def first_question
    questions.first
  end

  def next_question
    questions.find do |question|
      !answered_questions.include?(question)
      # !question.in? answered_questions
    end
  end

  def last_question
    questions.last
  end
end
