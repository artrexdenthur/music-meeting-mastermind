class AddUserIdToChoruses < ActiveRecord::Migration[5.2]
  def change
    add_column :choruses, :user_id, :integer
  end
end
