class Answer < ApplicationRecord
  belongs_to :question
  has_one :piece, through: :question
  
  has_many :user_journey_answers, dependent: :destroy
end
