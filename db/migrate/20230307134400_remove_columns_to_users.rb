class RemoveColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :encrypted_password, :string
    remove_column :users, :email_address, :string
  end
end
