class AddLocationtoPieces < ActiveRecord::Migration[7.0]
  def change
    add_column :pieces, :location, :string
  end
end
