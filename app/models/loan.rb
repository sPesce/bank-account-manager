class Loan < ApplicationRecord
  belongs_to :online_banking_account
  before_create :set_monthly_payment
  
  private
  def maturity_months
    (self.maturity_date.year * 12 + self.maturity_date.month) - (self.created_at.year * 12 + self.created_at.month)
  end
  def set_monthtly_payment    
    self.monthly_payment = (1+self.intrest_rate)*(self.amount)/maturity_months
  end

end
