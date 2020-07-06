class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.integer :online_banking_account_id
      t.string :type
      t.decimal :intrest_rate
      t.date :due_date
      t.decimal :monthly_charge
      t.decimal :balance

      t.timestamps
    end
  end
end
