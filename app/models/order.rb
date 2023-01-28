class Order < ApplicationRecord


  has_many :order_items, dependent: :destroy
  belongs_to :customer
  has_many :items, through: :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_payment: 0, payment_confirmation: 1, production: 2, shipping_preparation: 3, shipped: 4}
end
