RSpec.describe '/Chefs/Show' do 
  describe 'user_story_2' do 
    before :each do 
      @chef = Chef.create!(name: "Chef")
      @dish_1 = @chef.dishes.create!(name: "Tasty Burger", description: "Now this is a tasty burger!", chef_id: @chef.id)
      @ingredient_1 = @dish_1.ingredients.create!(name: "Ingredient 1", calories: 100)
      @ingredient_2 = @dish_1.ingredients.create!(name: "Ingredient 2", calories: 200)

      @dish_2 = @chef.dishes.create!(name: "French Fries", description: "These are some fries.", chef_id: @chef.id)
    end

    it 'displays the name of the chef' do 
      visit "/chef/#{@chef.id}"
      expect(page).to have_content("Chef")
    end

    it 'displays a list of all of the chefs dishes' do 
      visit "/chef/#{@chef.id}"
      expect(page).to have_content("Tasty Burger")
      expect(page).to have_content("French Fries")
    end

    it 'displays a form to add an existing dish to that chef' do 
      visit "/chef/#{@chef.id}"
      expect(page).to have_field(:dish_name)
    end

    it 'redirects you to the chefs show page upon submitting the form' do 
      visit "/chef/#{@chef.id}"
      fill_in('Name', with: 'Tasty Burger')
      click_on("Select Dish")
      expect(current_path).to eq("/chef/#{@chef.id}")
      expect(page).to have_content("Tasty Burger")
    end
  end 
end