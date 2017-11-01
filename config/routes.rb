Rails.application.routes.draw do
  get '/', to: 'pages#home'
  root 'pages#home'

  get '/about', to: 'pages#about'

  get '/articles/new', to: 'articles#new'
end
