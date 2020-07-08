class Loan < ApplicationRecord
  belongs_to :online_banking_account

  def monthly_charge
    ((self.intrest_rate + 1) * self.amount) / self.maturity_months
  end
  
  def maturity_months
    (self.maturity_date.year * 12 + self.maturity_date.month) - (self.created_at.year * 12 + self.created_at.month)
  end
  
  

end
