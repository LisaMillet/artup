class AddUserJourneyPieceToUserJourneyAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_journey_answers, :user_journey_piece, null: false, foreign_key: true
  end
end
