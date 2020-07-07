class AddRoutingNumberToBank < ActiveRecord::Migration[6.0]
  def change
    add_column :banks, :routing_number, :integer
  end
end
