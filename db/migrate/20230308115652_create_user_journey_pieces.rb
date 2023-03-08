class CreateUserJourneyPieces < ActiveRecord::Migration[7.0]
  def change
    create_table :user_journey_pieces do |t|
      t.references :user_journey, null: false, foreign_key: true
      t.references :piece, null: false, foreign_key: true

      t.timestamps
    end
  end
end
