class ChefsController < ApplicationController 
  def show 
    @chef = Chef.find(chef_params)
  end

  def edit 

  end

  def update 
    dish = Dish.find(params[:name])
    dish.update(chef_id: @chef.id)
    redirect_to "/chefs/#{@chef.id}"
  end

  private 
  def chef_params 
    params.permit(:id)
  end
end