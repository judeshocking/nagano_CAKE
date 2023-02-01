class RemoveStatusFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :status, :integer
  end
end
