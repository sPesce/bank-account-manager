class AddMaturityMonthsToLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :maturity_months, :integer
  end
end
