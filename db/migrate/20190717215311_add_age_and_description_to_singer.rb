class AddAgeAndDescriptionToSinger < ActiveRecord::Migration[5.2]
  def change
    add_column :singers, :age, :integer
    add_column :singers, :description, :text
  end
end
