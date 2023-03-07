class AddDescriptionToJourneys < ActiveRecord::Migration[7.0]
  def change
    add_column :journeys, :description, :text
  end
end
