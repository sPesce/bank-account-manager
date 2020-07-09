class Bank < ApplicationRecord
  has_many :online_banking_accounts
  has_many :deposit_accounts, through: :online_banking_accounts
  has_many :loans, through: :online_banking_accounts
  has_many :users, through: :online_banking_accounts

  validates :name, uniqueness: true

  def self.user_has_none(user_id)
    used_bank_ids = OnlineBankingAccount.where("user_id = ?",user_id).pluck(:bank_id)
    Bank.where.not(id: used_bank_ids)
  end
end
