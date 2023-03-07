class AddStatusToUserJourneys < ActiveRecord::Migration[7.0]
  def change
    add_column :user_journeys, :status, :boolean, default: true
  end
end
