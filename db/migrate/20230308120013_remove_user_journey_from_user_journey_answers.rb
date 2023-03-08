class RemoveUserJourneyFromUserJourneyAnswers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :user_journey_answers, :user_journey, null: false, foreign_key: true
  end
end
