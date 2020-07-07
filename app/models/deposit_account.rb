class DepositAccount < ApplicationRecord
  belongs_to :online_banking_account
  def routing_number
    self.online_banking_account.bank.routing_number
  end
  def open_date
    self.created_at
  end
end
