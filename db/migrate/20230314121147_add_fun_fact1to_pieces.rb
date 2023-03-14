class AddFunFact1toPieces < ActiveRecord::Migration[7.0]
  def change
    add_column :pieces, :fun_fact_1, :string
  end
end
