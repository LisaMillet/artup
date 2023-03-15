class Question < ApplicationRecord
  belongs_to :piece
  has_many :answers, dependent: :destroy

  def right_answer_content
    right_answer = answers.find_by(right_answer: true)
    right_answer.content
  end

end
