class RemoveTimestampFromCustomer < ActiveRecord::Migration[5.1]
  def change
    remove_column :customers, :timestamps
  end
end
