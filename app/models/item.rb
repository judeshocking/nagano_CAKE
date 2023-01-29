class Item < ApplicationRecord

  def with_tax_price
    (price * 1.1).floor
  end

  validates :name, presence: true
	validates :introduction, presence: true
	validates :price, 		  presence: true
	validates :is_active, inclusion: { in: [true, false] }
	has_many :cart_items, dependent: :destroy
	has_many :order_items, dependent: :destroy
	belongs_to :genre
	attachment :image

end
