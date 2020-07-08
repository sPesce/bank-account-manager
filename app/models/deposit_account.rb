class DepositAccount < ApplicationRecord
  before_create :generate_account_number
  belongs_to :online_banking_account
  
  #extracted from bank, since DA belongs to OBA, which belongs to Bank 
  def routing_number
    self.online_banking_account.bank.routing_number
  end
  def open_date
    self.created_at
  end
  #print balance in the form $xxxx.xx
  def balance_to_s
    dollars,cents = self.balance.to_s.split('.')
    string = "$#{dollars}."
    #decimal doesnt always come back with two decimal places
    cents[1] ? string += cents[0..1] : string += cents[0] + "0"    
  end
  private
  #set account number before creation
  #TODO: Validate that it hasnt been used
  def generate_account_number
    self.account_number = Faker::Bank.account_number
  end
end
