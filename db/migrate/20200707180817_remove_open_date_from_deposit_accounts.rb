class RemoveOpenDateFromDepositAccounts < ActiveRecord::Migration[6.0]
  def change
    remove_column :deposit_accounts, :open_date, :date
  end
end
