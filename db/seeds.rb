# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
# 	email: "a@bc",
# 	password:"123321"
# )
# EndUser.create!(
# 	id:"2",
# 	first_name: "マイケル",last_name:"ジョンコン",first_name_kana:"まいける",last_name_kana:"じょんこん",
# 	address:"川崎市多摩区5丁目",add_code:"2130012",email:"0@12",password:"123456",phone_number:"12312321",
# 	is_vaild:"exit"

# 	)
Address.create!(
	id:"1",
	end_user_id:"1",
	address:"なんかどこでもいいか",
	add_code:"2130032",
	name:"わし" )


# Genre.create!(
# 	id:'1' ,name: '漫画',is_vaild:'exit'

# 	)
# Item.create!(
#  	id:'1', name:'君が僕ら',no_tax_price:'500',detail:"なんていうか地獄みたいな漫画お",genre_id:'1',is_sale:'true',image: File.open('./app/assets/images/test.jpg')

# 	)