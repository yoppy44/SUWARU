Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "users#index"
  resources :users, only: [:index]
  resources :targets, only: [:index, :new, :create] do
    collection do
      get 'search'
    end
  end  
end
