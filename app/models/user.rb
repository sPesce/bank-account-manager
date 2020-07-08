class User < ApplicationRecord
  has_many :online_banking_accounts
  has_many :deposit_accounts, through: :online_banking_accounts
  has_many :loans, through: :online_banking_accounts
  has_many :banks, through: :online_banking_accounts

  # #validation todo
  # -user
  # ~username should start with a letter
  # username should be string with no spaces and distinct
  # is not taken
  # first name / last name - only letters

  # -deposit_accounts and loans
  # balance should start at amount
  # amount should be positive number

  # -bank
  # name should be distinct
  
  # online_banking_accounts
  # ~username should start with a letter
  # username should be string with no spaces and distinct

  #maybe add this:
  # --renenber to use the intrest rate (intrest rate only applies to whats being paid back)
  # --    ...it does not apply to the amount given into the checking
  #loan requires a checking account
  #creating loan adds the amount to checking balance
  #   and removes amount from loan balance
  #  ...so that loan account is the account that the loan is paid back to
  #   and checking account is where the loan money is given
  #
  
  
end
