class AddStatusToUserJourneyPieces < ActiveRecord::Migration[7.0]
  def change
    add_column :user_journey_pieces, :status, :integer
  end
end
