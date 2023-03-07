class ChangeUserAnswersToUserJourneyAnswers < ActiveRecord::Migration[7.0]
  def change
    rename_table :user_answers, :user_journey_answers
  end
end
