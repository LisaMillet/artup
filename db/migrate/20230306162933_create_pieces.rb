class CreatePieces < ActiveRecord::Migration[7.0]
  def change
    create_table :pieces do |t|
      t.string :name
      t.text :description
      t.string :artist
      t.text :materials_techniques
      t.integer :creation_year
      t.text :media

      t.timestamps
    end
  end
end
