Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  get "/about", to: 'welcome#show', as: "about"
  get "logout", to: "sessions#destroy", as: "logout"
  get "login", to: "sessions#new", as: "login"
  get "register", to: "users#new", as: "register"
  post "register", to: "users#create"
  get '/dashboard', to: "clients#show"

  get '/trainer/dashboard', to: 'trainers#show'
  get '/trainer/invite', to: 'invite#new'
  post '/trainer/invite', to: 'invite#create'
end
