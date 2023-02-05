class Order < ApplicationRecord

  validates :billing_amount, presence: true
  validates :payment_method, presence: true
  validates :address, length: { in: 1..48 }
  validates :postal_code, presence: true
  validates :name, length: { in: 1..32 }
  validates :status, presence: true


  has_many :order_items, dependent: :destroy
  belongs_to :customer
  has_many :items, through: :order_details

  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum status: { waiting_payment: 0, payment_confirmation: 1, production: 2, shipping_preparation: 3, shipped: 4}

end
