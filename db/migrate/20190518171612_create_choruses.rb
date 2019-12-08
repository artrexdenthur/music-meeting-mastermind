class CreateChoruses < ActiveRecord::Migration[5.2]
  def change
    create_table :choruses do |t|
      t.string "name"
      t.integer "type_code"
      t.timestamps
    end
  end
end
