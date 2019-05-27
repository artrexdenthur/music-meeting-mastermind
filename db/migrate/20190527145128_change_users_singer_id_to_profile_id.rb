class ChangeUsersSingerIdToProfileId < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :singer_id, :profile_id
  end
end
