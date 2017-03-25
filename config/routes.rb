Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sessions/new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
