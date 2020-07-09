Rails.application.routes.draw do
  
  resources :users do
    resources :online_banking_accounts, only: [:show,:new,:create]
  end
  #checking
  get '/users/:user_id/online_banking_accounts/:online_banking_account_id/open_checking_account' => 
  'online_banking_accounts#new_checking_account', as: "new_checking"
  
  post '/users/:user_id/online_banking_accounts/:online_banking_account_id/open_checking_account' =>
   'online_banking_accounts#open_checking_account', as: "open_checking_account"
  #savings
  get '/users/:user_id/online_banking_accounts/:online_banking_account_id/open_savings_account' =>
   'online_banking_accounts#new_savings_account', as: "new_savings"
  
  post '/users/:user_id/online_banking_accounts/:online_banking_account_id/open_savings_account' =>
   'online_banking_accounts#open_savings_account', as: "open_savings_account"
  #loans
   get '/users/:user_id/online_banking_accounts/:online_banking_account_id/apply_loan' =>
   'online_banking_accounts#new_loan', as: "new_loan"
  
  post '/users/:user_id/online_banking_accounts/:online_banking_account_id/apply_loan' =>
   'online_banking_accounts#create_loan', as: "create_loan"

  
  get '/signup' => 'users#new'
  post '/signup'=> 'users#create'
  get '/users/:id/home' => 'users#homepage', as: "home"
  get '' => 'sessions#new'
  post '' => 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

