class OnlineBankingAccount < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  has_many :loans
  has_many :deposit_accounts

  validates :username, format: { with: /\A[a-zA-Z0-9\s]+\z/i, message: "can only contain letters and numbers." }
  validates :username, format: { without: /\s/, message: "must contain no spaces" }
  
end
