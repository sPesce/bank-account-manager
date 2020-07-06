class CreateDepositAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :deposit_accounts do |t|
      t.integer :online_banking_account_id
      t.string :type
      t.decimal :balance
      t.date :open_date
      t.date :closed_date

      t.timestamps
    end
  end
end
