class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: {制作不可: 0, 制作待: 1, 製作中: 2, 完成: 3}

end
