require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance methods' do 
    before :each do 
      @chef = Chef.create!(name: "Chef")
      @dish = @chef.dishes.create!(name: "Dish", description: "asdf", chef_id: @chef.id)
      @ingredient_1 = @dish.ingredients.create!(name: "Ingredient 1", calories: 100)
      @ingredient_2 = @dish.ingredients.create!(name: "Ingredient 2", calories: 200)
    end
    it '#total_calories' do 
      expect(@dish.total_calories).to eq(300)
    end
  end
end