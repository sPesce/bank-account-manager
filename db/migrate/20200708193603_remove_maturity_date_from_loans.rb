class RemoveMaturityDateFromLoans < ActiveRecord::Migration[6.0]
  def change
    remove_column :loans, :maturity_date, :date
  end
end
