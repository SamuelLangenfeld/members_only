Rails.application.routes.draw do
  resources :posts, only: [:new, :index, :create]
  root 'static_pages#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/user', to: 'users#show'

end
