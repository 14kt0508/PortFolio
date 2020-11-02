# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Facility.create(facility_name: "たいよう", email: "admin@test.com")
Facility.create(facility_name: "にじいろ", email: "test@admin.com")
Facility.create(facility_name: "そら", email: "tesu@test.com")


Admin.create!(
	facility_id: 1,
	email: "admin@test.com",
	password: "123456",
	family_name: "田中",
    family_name_kana: "タナカ",
    first_name: "太郎",
    first_name_kana: "タロウ",
)


User.create!(
	family_name:'山田',
	first_name:'詩織',
	family_name_kana:'ヤマダ',
	first_name_kana:'シオリ',
	post_code:'123-4567',
	address:'東京都世田谷区3333',
	telephone:'00066660000',
	email:'test@test.com',
	password: '111111'
)

# PickUpPerson.create!(
# 	user_id: 1,
# 	family_name:'山田',
# 	first_name:'一郎',
# 	family_name_kana:'ヤマダ',
# 	first_name_kana:'イチロウ',
# 	birth_date:'1995,1,1'
# 	post_code:'123-4567',
# 	address:'東京都世田谷区3333',
# 	telephone:'00066660000',
# 	relationship:'父',
# )

# Child.create!(
# 	user_id: 1,
# 	family_name:'山田',
# 	first_name:'太郎',
# 	family_name_kana:'ヤマダ',
# 	first_name_kana:'タロウ',
# 	class_name_id: 2,
# 	pick_up_person:'母',
# 	pick_up_time:'16:00',
# 	allergies:'特になし',
# 	remarks: '特になし'
# )

ClassName.create(name: "全クラス")
ClassName.create(name: "あおぞら")
ClassName.create(name: "にじ")
ClassName.create(name: "おひさま")
ClassName.create(name: "ほし")
ClassName.create(name: "つき")
ClassName.create(name: "うちゅう")

Event.create(title: "test", body:"test", time: "DateTime.now")