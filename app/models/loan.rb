class Loan < ApplicationRecord
  belongs_to :online_banking_account

  def monthly_charge
    ((self.intrest_rate + 1) * self.amount) / self.maturity_months
  end
<<<<<<< HEAD

  def maturity_date
    self.created_at + self.maturity_months.months
=======
  def set_monthtly_payment    
    self.monthly_payment = (1+self.intrest_rate)*(self.amount)/maturity_months
>>>>>>> issa
  end

  #interest rate is 1% for every 12 months
  #(maturity/12)/(100) = maturity/1200
  def interest_rate
    self.maturity_months/1200.0
  end
end
