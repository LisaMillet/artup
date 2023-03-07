class ChangeCreationYearType < ActiveRecord::Migration[7.0]
  def change
    change_column :pieces, :creation_year, :string
  end
end
