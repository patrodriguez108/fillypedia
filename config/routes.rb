Rails.application.routes.draw do
  get '/', to: 'pages#home'
  root 'pages#home'

  get '/about', to: 'pages#about'

  resources :articles do
    resources :versions
  end
  # get '/articles/new', to: 'articles#new'
  # post '/articles/:article_id/versions', to: 'versions#create'

  resources :categories do
    resources :articles
  end

  get '/signup', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
