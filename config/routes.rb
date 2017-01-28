Rails.application.routes.draw do
  root to: 'pages#index'

  get 'pages/index'
  get 'pages/secret'

  get '/auth/:provder/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
