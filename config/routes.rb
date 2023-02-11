Rails.application.routes.draw do
  root to: 'public_recipes#index'
  devise_for :users, controllers: { registrations: "registrations" }
  resources :recipes, only: [:new, :create, :index, :show, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :general_shopping_list, only: [:index]
end
