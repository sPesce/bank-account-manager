class OnlineBankingAccount < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  has_many :loans
  has_many :deposit_accounts
end
