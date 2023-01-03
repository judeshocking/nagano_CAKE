class Item < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
	validates :introduction, presence: true
	validates :price, 		  presence: true
	validates :is_active, presence: true
	has_many :cart_items, dependent: :destroy
	belongs_to :genre
	enum sale_status: [:販売可, :販売不可]
end
