Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :create]
  resources :invitations, only: [:index, :show, :create, :update]
  resources :users, only: [:index, :create]
  resources :user_games, only: [:index, :show, :create]
  post '/login', to: 'login#create'
  get '/users/profile', to: 'users#profile'
  post 'twilio/text' => 'twilio#text'

end
