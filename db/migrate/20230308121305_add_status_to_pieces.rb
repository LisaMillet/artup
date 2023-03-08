class AddStatusToPieces < ActiveRecord::Migration[7.0]
  def change
    add_column :pieces, :status, :integer, default: 0
  end
end
