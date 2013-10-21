PlumPantry::Application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :recipes, only [:new, :create,:index, :show]
end
