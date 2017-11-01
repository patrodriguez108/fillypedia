Rails.application.routes.draw do
  get '/', to: 'pages#home'
  root 'pages#home'

  get '/about', to: 'pages#about'

  get '/signup', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'

  get '/login', to: 'sessions#new', as: 'login'
end
