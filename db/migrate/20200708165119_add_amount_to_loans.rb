class AddAmountToLoans < ActiveRecord::Migration[6.0]
  def change       
    add_column :loans, :amount, :decimal
  end
end
