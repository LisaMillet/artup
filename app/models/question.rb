class Question < ApplicationRecord
  belongs_to :piece
  has_many :answers, dependent: :destroy
end
