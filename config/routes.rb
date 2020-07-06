Rails.application.routes.draw do
  resources :users, only: [:new,:create]
  resources :online_banking_accounts, only: [:new,:create,:destroy]
  
  get '/users/:id/home' => 'users#homepage', as: "home"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# get '/signup' => 'users#new'
# post '/signup'=> 'users#create'