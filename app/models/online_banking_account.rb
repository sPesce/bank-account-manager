class OnlineBankingAccount < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  has_many :loans
  has_many :deposit_accounts

  validates :username, format: { with: /\A[a-zA-Z0-9\s]+\z/i, message: "can only contain letters and numbers." }
  validates :username, format: { without: /\s/, message: "must contain no spaces" }
    
  def total_balance
   
    deposit_sum = DepositAccount.where(online_banking_account_id: self.id).pluck(:balance).sum
    loan_sum = Loan.where(online_banking_account_id: self.id).pluck(:balance).sum
    total_sum = deposit_sum + loan_sum
    total_sum
    
  end
end


