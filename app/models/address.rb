class Address < ApplicationRecord
	belongs_to :end_user


  # def finally_address
  #     self.add_code + ' '+ self.address + '  ' + self.name
  # end
  def finally_address
    "〒" + add_code + " " + address + " " + name
  end

end
