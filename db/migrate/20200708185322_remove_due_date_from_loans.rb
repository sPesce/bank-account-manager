class RemoveDueDateFromLoans < ActiveRecord::Migration[6.0]
  def change
    remove_column :loans, :due_date, :date
  end
end
