class CreateSingers < ActiveRecord::Migration[5.2]
  def change
    create_table :singers do |t|
      t.text :name
      t.text :preferred_voice_part

      t.timestamps
    end
  end
end
