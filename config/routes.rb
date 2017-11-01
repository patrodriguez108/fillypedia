Rails.application.routes.draw do
  get '/', to: 'pages#home'
  root 'pages#home'

  get '/about', to: 'pages#about'
  resources :articles do
    resources :versions
  end
  # get '/articles/new', to: 'articles#new'
  # post '/articles/:article_id/versions', to: 'versions#create'
end
