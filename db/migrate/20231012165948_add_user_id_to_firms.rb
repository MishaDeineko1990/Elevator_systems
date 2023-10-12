class AddUserIdToFirms < ActiveRecord::Migration[7.1]
  def change
    add_column :firms, :user_id, :integer
    add_index :firms, :user_id
  end
end
