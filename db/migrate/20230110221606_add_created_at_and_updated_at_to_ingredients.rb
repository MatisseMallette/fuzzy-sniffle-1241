class AddCreatedAtAndUpdatedAtToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :created_at, :datetime
    add_column :ingredients, :updated_at, :datetime
  end
end
