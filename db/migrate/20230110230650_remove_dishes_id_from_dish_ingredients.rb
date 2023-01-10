class RemoveDishesIdFromDishIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :dish_ingredients, :dishes_id, :bigint
  end
end
