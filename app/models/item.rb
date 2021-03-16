class Item < ApplicationRecord

  with_options presence: true do
    validates :item_name
    validates :information
    validates :price
  end

  belongs_to :user
  has_one_attached :image
end
