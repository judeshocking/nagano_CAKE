class Item < ApplicationRecord
  has_one_attached :image
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  validates :name, presence: true
	validates :introduction, presence: true
	validates :price, 		  presence: true
	validates :is_active, inclusion: { in: [true, false] }
	has_many :cart_items, dependent: :destroy
	belongs_to :genre
	attachment :image

end
