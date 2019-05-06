class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.integer :singer_id
      t.integer :chorus_id

      t.timestamps
    end
  end
end
