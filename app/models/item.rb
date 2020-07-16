class Item < ApplicationRecord
	belongs_to :genre
	has_many :cart_items, dependent: :destroy
	validates :name, presence: true
	validates :no_tax_price, presence: true
	validates :genre_id, presence: true
	validates :name, presence: true
	attachment :image
end
