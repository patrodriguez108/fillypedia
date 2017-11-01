Rails.application.routes.draw do
  get '/', to: 'pages#home'
  root 'pages#home'

  get '/about', to: 'pages#about'


  resources :categories do
    resources :articles
  end

end
