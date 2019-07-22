Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  get "/about", to: 'welcome#show', as: "about"

  get "logout", to: "sessions#destroy", as: "logout"
  get "login", to: "sessions#new", as: "login"

  get "register", to: "users#new", as: "register"

  get "/client/dashboard", to: "clients#show"
  # get '/trainer/dashboard', to: 'trainers#show'# ?
  post "register", to: "users#create"

  namespace :trainer do
    get '/invite', to: 'invite#new'
    post '/invite', to: 'invite#create'
    get '/dashboard', to: 'dashboard#show'
    get '/clients/:id', to: 'clients#show', as: "client"
    get "register/:trainer", to: "clients#new"
    post "register/:trainer", to: "clients#create"
  end


  resource :meal_logs, only: [:new, :create]
  resource :meal_searches, only: :create

  get '/trainer_messages/new', to: 'clients/trainer_messages#new'
  post '/trainer_messages/create', to: 'clients/trainer_messages#create'
end
