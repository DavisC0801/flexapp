Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  get "/about", to: 'welcome#show', as: "about"

  get "logout", to: "sessions#destroy", as: "logout"
  get "login", to: "sessions#new", as: "login"

  get "register", to: "users#new", as: "register"
  get "/dashboard", to: "users#show"

  namespace :trainer do
    get '/dashboard', to: 'dashboard#show'
    get '/clients/:id', to: 'clients#show', as: "client"
  end

  resource :meal_logs, only: [:new, :create]
  resource :meal_searches, only: :create
end
