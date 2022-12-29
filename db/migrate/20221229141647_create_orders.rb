class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.integer :postage,default: 800, null: false
      t.integer :billing_amount,default: 0, null: false
      t.string :postal_code,null: false
      t.string :address,null: false
      t.string :name,null: false

      t.timestamps
    end
  end
end
