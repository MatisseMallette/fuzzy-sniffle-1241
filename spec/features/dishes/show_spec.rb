require 'rails_helper'

RSpec.describe '/Dishes/Show' do 
  describe 'user_story_1' do 
    before :each do 
      @chef = Chef.create!(name: "Chef")
      @dish = @chef.dishes.create!(name: "Tasty Burger", description: "Now this is a tasty burger!", chef_id: @chef.id)
      @ingredient_1 = @dish.ingredients.create!(name: "Ingredient 1", calories: 100)
      @ingredient_2 = @dish.ingredients.create!(name: "Ingredient 2", calories: 200)
    end

    it 'displays name of dish' do 
      visit "dishes/#{@dish.id}"  
      expect(page).to have_content("Tasty Burger")
    end

    it 'displays name of chef' do 
      visit "dishes/#{@dish.id}"  
      expect(page).to have_content("Prepared by: Chef")
    end

    it 'displays each ingredient' do 
      visit "dishes/#{@dish.id}"  
      expect(page).to have_content("Ingredient 1")
      expect(page).to have_content("Ingredient 2")
    end

    it 'displays the total calorie count' do 
      visit "dishes/#{@dish.id}"  
      expect(page).to have_content("300")
    end
  end
end