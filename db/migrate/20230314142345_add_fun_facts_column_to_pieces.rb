class AddFunFactsColumnToPieces < ActiveRecord::Migration[7.0]
  def change
    add_column :pieces, :fun_fact_2, :string
    add_column :pieces, :fun_fact_3, :string
    add_column :pieces, :fun_fact_4, :string
    add_column :pieces, :fun_fact_5, :string
  end
end
