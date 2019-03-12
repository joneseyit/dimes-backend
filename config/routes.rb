Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :create]
  resources :invitations, only: [:index, :show, :create]
  resources :users, only: [:index, :show, :create]
  resources :user_games, only: [:index, :show, :create]
  post '/login', to: 'login#create'

end
