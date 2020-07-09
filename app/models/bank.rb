class Bank < ApplicationRecord
  has_many :online_banking_accounts
  has_many :deposit_accounts, through: :online_banking_accounts
  has_many :loans, through: :online_banking_accounts
  has_many :users, through: :online_banking_accounts

  validates :name, uniqueness: true

  def self.user_has_none(user)
    used_banks_ids = OnlineBankingAccount.where("user_id = ?",user.id).pluck(:bank_ids)
    self.class.all.pluck(:id).map do |id|
      if !used_bank_ids.include? id
        Self.find(id)
      end
    end
  end
end
