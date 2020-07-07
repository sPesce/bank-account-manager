Rails.application.routes.draw do
  #resources :users, only: [:new,:create]
  resources :online_banking_accounts, only: [:new,:create,:destroy]
  
  resources :users do
    resources :online_banking_accounts, only: [:show,:new,:create]
  end

  get '/users/:id/online_banking_accounts/:bank_account_id/open_checking_account' => 
  'online_banking_accounts#new_checking_account', as: "new_checking"
  
  post '/users/:id/online_banking_accounts/:bank_account_id/open_checking_account' =>
   'online_banking_accounts#open_checking_account'
  
  get '/users/:id/online_banking_accounts/:bank_account_id/open_savings_account' =>
   'online_banking_accounts#new_savings_account', as: "new_savings"
  
  post '/users/:id/online_banking_accounts/:bank_account_id/open_savings_account' =>
   'online_banking_accounts#open_savings_account'

  get '/signup' => 'users#new'
  post '/signup'=> 'users#create'
  get '/users/:id/home' => 'users#homepage', as: "home"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

