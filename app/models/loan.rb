class Loan < ApplicationRecord
  belongs_to :online_banking_account
  before_create :transfer_to_checking
  include AccountModule
  
  #validation make sure there is a checking account

  def monthly_charge
    ((self.intrest_rate + 1) * self.amount) / self.maturity_months
  end

  def maturity_date
    self.created_at + self.maturity_months.months
  end

  #interest rate is 1% for every 12 months
  #(maturity/12)/(100) = maturity/1200
  def interest_rate
    self.maturity_months/1200.0
  end

  def transfer_to_checking
    checking = self.online_banking_account.deposit_accounts.find_by(category: "checking")
    checking.balance += self.amount
    checking.save
    self.balance = 0 - ((1 + self.interest_rate) * self.amount) 
  end
end
