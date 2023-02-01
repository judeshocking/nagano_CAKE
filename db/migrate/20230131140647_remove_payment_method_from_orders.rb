class RemovePaymentMethodFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :payment_method, :integer
  end
end
