class AddMaturityDateToLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :maturity_date, :date_time
  end
end
