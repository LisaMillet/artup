class CreateJourneyPieces < ActiveRecord::Migration[7.0]
  def change
    create_table :journey_pieces do |t|
      t.references :journey, null: false, foreign_key: true
      t.references :piece, null: false, foreign_key: true

      t.timestamps
    end
  end
end
