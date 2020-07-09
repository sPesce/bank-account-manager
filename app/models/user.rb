class User < ApplicationRecord
  has_secure_password
  
  has_many :online_banking_accounts
  has_many :deposit_accounts, through: :online_banking_accounts
  has_many :loans, through: :online_banking_accounts
  has_many :banks, through: :online_banking_accounts

  validates :first_name, :last_name, :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { without: /\s/, message: "must contain no spaces" }
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  # #validation todo
  # -user
  # ~username should start with a letter => ok
  # username should be string with no spaces and distinct => ok
  # is not taken => ok
  # first name / last name - only letters => ok

  # -deposit_accounts and loans
  # balance should start at amount
  # amount should be positive number

  # -bank
  # name should be distinct
  
  # online_banking_accounts
  # ~username should start with a letter => ok
  # username should be string with no spaces and distinct => ok

  #maybe add this:
  # --renenber to use the intrest rate (intrest rate only applies to whats being paid back)
  # --    ...it does not apply to the amount given into the checking
  #loan requires a checking account
  #creating loan adds the amount to checking balance
  #   and removes amount from loan balance
  #  ...so that loan account is the account that the loan is paid back to
  #   and checking account is where the loan money is given
  #
  def total_balance
    self.online_banking_accounts
  end
  def checking_account
    self.deposit_accounts.where("category = ?", "checking").first
  end
  def savings_account
    self.deposit_accounts.where("category = ?", "savings").first
  end
end
