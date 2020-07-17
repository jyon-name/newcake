class Address < ApplicationRecord
	belongs_to :end_user
	validates :add_code, presence: true,length: {maximum: 7,minimum: 7}
 	validates :address, presence: true
 	validates :name, presence: true

  # def finally_address
  #     self.add_code + ' '+ self.address + '  ' + self.name
  # end
  def finally_address
    "〒" + add_code + " " + address + " " + name
  end

end
