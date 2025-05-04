class Reward < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :points_required, presence: true, numericality: { greater_than: 0 }

  AVAILABLE_CATEGORIES = [ "Discounts", "Products", "Gift Cards" ]
end
