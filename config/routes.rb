Rails.application.routes.draw do
  get '/register', to:'trainers#new', as: 'trainer_register'
  post '/register', to:'trainers#create'
  get '/dashboard', to:'users#show', as: 'dashboard'
end
