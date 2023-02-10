Rails.application.routes.draw do
  root to: 'public_recipes#index'
  devise_for :users, controllers: { registrations: "registrations" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :recipes, only: [:index, :show, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  resources :foods, only: [:index, :new, :create, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
