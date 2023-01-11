Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dishes, only: [:show]

  resources :chefs, only: [:show, :edit, :update]
  resources :chefs do 
    resources :dishes, only: [:edit]
  end
end
