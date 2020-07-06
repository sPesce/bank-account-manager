Rails.application.routes.draw do
  resources :online_banking_accounts
  resources :deposit_accounts
  resources :loans
  resources :banks
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
