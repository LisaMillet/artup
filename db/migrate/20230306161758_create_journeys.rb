class CreateJourneys < ActiveRecord::Migration[7.0]
  def change
    create_table :journeys do |t|
      t.integer :discount
      t.string :name

      t.timestamps
    end
  end
end
