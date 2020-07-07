class AddAccountNumberToDepositAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :deposit_accounts, :account_number, :integer
  end
end
