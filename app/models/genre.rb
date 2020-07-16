class Genre < ApplicationRecord
	has_many :items
	validates :is_vaild, presence: true
	validates :name, presence: true
	enum is_vaild: { not_exit: false, exit: true }
end
