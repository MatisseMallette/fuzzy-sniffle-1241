class ChefsController < ApplicationController 
  def show 
    @chef = Chef.find(chef_params[:id])
  end

  def edit 

  end

  def update 
    chef = Chef.find(params[:chef_id])
    dish = Dish.find_by(name: params[:name])
    dish.update(chef_id: chef.id)
    redirect_to "/chefs/#{chef.id}"
  end

  private 
  def chef_params 
    params.permit(:id)
  end
end