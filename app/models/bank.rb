class Bank < ApplicationRecord
  has_many :online_banking_accounts
  has_many :deposit_accounts, through: :online_banking_accounts
  has_many :loans, through: :online_banking_accounts
  has_many :users, through: :online_banking_accounts
end
