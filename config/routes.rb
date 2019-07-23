Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  get "/about", to: 'welcome#show', as: "about"

  get "logout", to: "sessions#destroy", as: "logout"
  get "login", to: "sessions#new", as: "login"

  get "register", to: "users#new", as: "register"

  get "/client/dashboard", to: "clients#show"

  post "register", to: "users#create"
  post '/login', to: 'sessions#create'

  namespace :trainer do
    get '/invite', to: 'invite#new'
    post '/invite', to: 'invite#create'
    get '/dashboard', to: 'dashboard#show'
    get "register/:trainer", to: "clients#new", as: 'register'
    post "register/:trainer", to: "clients#create"
    resources :clients, only: [:show] do
      resources :meal_plans, only: [:new, :create, :edit, :update]
    end
  end


  resource :meal_logs, only: [:new, :create]
  resource :meal_searches, only: :create

  get '/trainer_messages/new', to: 'clients/trainer_messages#new'
  post '/trainer_messages/create', to: 'clients/trainer_messages#create'

  get 'trainer/client_messages/new', to: 'trainer/client_messages#new'
  post 'trainer/client_messages/create', to: 'trainer/client_messages#create'

  get '/weight_logs/new', to: 'clients/weight_logs#new'
  post '/weight_logs/create', to: 'clients/weight_logs#create', as: 'weight_logs'
end
