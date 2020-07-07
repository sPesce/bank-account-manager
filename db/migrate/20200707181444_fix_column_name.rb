class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :deposit_accounts, :type, :category
    rename_column :loans, :type, :category
  end
end
