PlumPantry::Application.routes.draw do
  resources :users, only: [:new, :create, :show, :index]
  resources :recipes, only: [:new, :create,:index, :show, :favorite, :remove] do
    member do
      post 'favorite'
      post 'remove'
    end
  end

  resources :ingredients, only: [:index, :show]

  resource :session, only: [:new, :create, :destroy]
  root to: 'recipes#index'
end
