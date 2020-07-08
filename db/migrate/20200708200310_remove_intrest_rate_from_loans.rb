class RemoveIntrestRateFromLoans < ActiveRecord::Migration[6.0]
  def change
    remove_column :loans, :intrest_rate, :decimal
  end
end
