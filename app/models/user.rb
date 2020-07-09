class User < ApplicationRecord
  has_secure_password
  
  has_many :online_banking_accounts
  has_many :deposit_accounts, through: :online_banking_accounts
  has_many :loans, through: :online_banking_accounts
  has_many :banks, through: :online_banking_accounts

  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { without: /\s/, message: "must contain no spaces" }
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  
  # total balance of all the accounts 

  def account_balance
    loan_balance = self.loans.select do |loan|
      loan.balance
    end.sum

    deposit_balance = self.deposit_accounts.select do |deposit|
      deposit.balance
    end.sum

    total_balance = loan_balance + deposit_balance
    total_balance
  end
  
  
end
