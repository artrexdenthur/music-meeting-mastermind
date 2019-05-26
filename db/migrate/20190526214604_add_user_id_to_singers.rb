class AddUserIdToSingers < ActiveRecord::Migration[5.2]
  def change
    add_column :singers, :user_id, :integer
  end
end
