class OnlineBankingAccount < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  has_many :loans
  has_many :deposit_accounts


  def build_checking_account(starting_balance)
    build_deposit_account("checking",starting_balance)
  end

  def build_savings_account(starting_balance)
    build_deposit_account("savings",starting_balance)
  end

  private
  def build_deposit_account(category,starting_balance)
    account = DepositAccount.new
    account.category = category
    account.account_number = Faker::Bank.account_number
    account.balance = starting_balance
    self.deposit_accounts << account
    account.save    
  end
end
