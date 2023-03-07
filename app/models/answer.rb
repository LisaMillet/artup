class Answer < ApplicationRecord
  belongs_to :question
  has_many :user_journey_answers, dependent: :destroy
end
