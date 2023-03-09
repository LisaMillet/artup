class AddSlugToPieces < ActiveRecord::Migration[7.0]
  def change
    add_column :pieces, :slug, :string
  end
end
