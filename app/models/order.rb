class Order < ApplicationRecord


  has_many :order_items, dependent: :destroy
  belongs_to :customer
  has_many :items, through: :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備完了: 3, 発送完了: 4}

end
