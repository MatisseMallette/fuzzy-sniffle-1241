class RemoveIngredientsIdFromDishIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :dish_ingredients, :ingredients_id, :bigint
  end
end
