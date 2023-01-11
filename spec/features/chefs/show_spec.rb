require 'rails_helper'

RSpec.describe '/Chefs/Show' do 
  describe 'user_story_2' do 
    before :each do 
      @chef = Chef.create!(name: "Chef")
      @chef_2 = Chef.create!(name: "Chef 2")

      @dish_1 = @chef.dishes.create!(name: "Tasty Burger", description: "Now this is a tasty burger!", chef_id: @chef.id)
      @ingredient_1 = @dish_1.ingredients.create!(name: "Ingredient 1", calories: 100)
      @ingredient_2 = @dish_1.ingredients.create!(name: "Ingredient 2", calories: 200)

      @dish_2 = @chef.dishes.create!(name: "French Fries", description: "These are some fries.", chef_id: @chef.id)
      @ingredient_3 = @dish_2.ingredients.create!(name: "Potatos", calories: 100)
      @ingredient_4 = @dish_2.ingredients.create!(name: "Grease", calories: 100)

      @dish_3 = @chef_2.dishes.create!(name: "Milkshake", description: "This is a milkshake.", chef_id: @chef_2.id)
      @ingredient_3 = @dish_3.ingredients.create!(name: "Milk", calories: 100)
      @ingredient_4 = @dish_3.ingredients.create!(name: "Shake", calories: 100)

    end

    it 'displays the name of the chef' do 
      visit "chefs/#{@chef.id}"
      expect(page).to have_content("Chef")
    end

    it 'displays a list of all of the chefs dishes' do 
      visit "chefs/#{@chef.id}"
      expect(page).to have_content("Tasty Burger")
      expect(page).to have_content("French Fries")
    end

    it 'displays a form to add an existing dish to that chef' do 
      visit "chefs/#{@chef.id}"
      expect(page).to have_field(:name)
    end

    it 'redirects you to the chefs show page upon submitting the form' do 
      visit "chefs/#{@chef.id}"

      fill_in('Name', with: 'Tasty Burger')
      click_on("Select Dish")

      expect(current_path).to eq("/chefs/#{@chef.id}")
      expect(page).to have_content("Tasty Burger")
      expect(page).to have_content("French Fries")
      expect(page).to_not have_content("Milkshake")

      fill_in('Name', with: 'Milkshake')
      click_on("Select Dish")

      expect(page).to have_content("Milkshake")
    end
  end 
end