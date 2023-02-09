Rails.application.routes.draw do
  # get 'foods/index'
  # get 'foods/create'
  # get 'foods/new'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :foods, :only => [:index, :create, :new]
  # Defines the root path route ("/")
  # root "articles#index"

  root "foods#index"

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :public, :new, :create, :destroy] do
    resources :recipe_foods , only: [:new, :index, :create, :destroy]
  end
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:show]

end
