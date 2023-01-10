class DropDishIdForDishIngredients < ActiveRecord::Migration[5.2]
  def change
    drop_table :dish_id_for_dish_ingredients
  end
end
