Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  get "/about", to: 'welcome#show'
  
  get "/logout", to: "sessions#destroy"
  get "/login", to: "sessions#new"

  get "/register", to: "users#new"
  get "/dashboard", to: "users#show"
end
