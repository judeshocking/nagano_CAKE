class AddMakingStatusToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :making_status, :integer,null: false, default: 0
  end
end
