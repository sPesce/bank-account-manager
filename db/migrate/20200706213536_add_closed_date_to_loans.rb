class AddClosedDateToLoans < ActiveRecord::Migration[6.0]
  def change
    add_column :loans, :closed_date, :date
  end
end
