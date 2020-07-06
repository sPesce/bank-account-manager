class CreateOnlineBankingAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :online_banking_accounts do |t|
      t.integer :user_id
      t.integer :bank_id
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
