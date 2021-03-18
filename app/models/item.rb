class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_status
  belongs_to :category
  belongs_to :inner_diameter
  belongs_to :outer_diameter

  with_options presence: true do
    validates :item_name
    validates :information
    validates :price
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :inner_diameter_id
    validates :outer_diameter_id
  end
  belongs_to :user
  has_one_attached :image
end
