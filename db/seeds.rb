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

ClassName.create(name: "全クラス")
ClassName.create(name: "あおぞら")
ClassName.create(name: "にじ")
ClassName.create(name: "おひさま")
ClassName.create(name: "ほし")
ClassName.create(name: "つき")
ClassName.create(name: "うちゅう")


admin=Admin.create!(
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

User.create!(
	family_name:'高橋',
	first_name:'翔太',
	family_name_kana:'タカハシ',
	first_name_kana:'ショウタ',
	post_code:'765-4321',
	address:'東京都世田谷区3333',
	telephone:'00011112222',
	email:'test@user.com',
	password: '123456'
)

PickUpPerson.create!(
	user_id: 1,
	family_name:'山田',
	first_name:'一郎',
	family_name_kana:'ヤマダ',
	first_name_kana:'イチロウ',
	birth_date:Time.new(1990, 1, 1, 0, 0, 0, 0),
	post_code:'123-4567',
	address:'東京都世田谷区3333',
	telephone:'00066660000',
	relationship:'父',
)

PickUpPerson.create!(
	user_id: 2,
	family_name:'高橋',
	first_name:'一郎',
	family_name_kana:'タカハシ',
	first_name_kana:'イチロウ',
	birth_date:Time.new(1990, 1, 1, 0, 0, 0, 0),
	post_code:'765-4321',
	address:'東京都世田谷区3333',
	telephone:'00011112222',
	relationship:'祖父',
)

Child.create!(
	user_id: 1,
	family_name:'山田',
	first_name:'太郎',
	family_name_kana:'ヤマダ',
	first_name_kana:'タロウ',
	birth_date:Time.new(2020, 4, 3, 0, 0, 0, 0),
	class_name_id: 2,
	pick_up_person:'母',
	pick_up_time:Time.new(2012, 6, 30, 16, 0, 0, 0),
	allergies:'特になし',
	remarks: '特になし'
)

Child.create!(
	user_id: 1,
	family_name:'山田',
	first_name:'二郎',
	family_name_kana:'ヤマダ',
	first_name_kana:'ジロウ',
	birth_date:Time.new(2020, 4, 3, 0, 0, 0, 0),
	class_name_id: 2,
	pick_up_person:'母',
	pick_up_time:Time.new(2012, 6, 30, 16, 0, 0, 0),
	allergies:'特になし',
	remarks: '特になし'
)

Child.create!(
	user_id: 2,
	family_name:'高橋',
	first_name:'壮太',
	family_name_kana:'タカハシ',
	first_name_kana:'ソウタ',
	birth_date:Time.new(2019, 11, 14, 0, 0, 0, 0),
	class_name_id: 3,
	pick_up_person:'母',
	pick_up_time:Time.new(2012, 6, 30, 18, 0, 0, 0),
	allergies:'特になし',
	remarks: '特になし'
)

Event.create(
	title: "test",
	body:"test",
	start: Time.new(2020, 11, 30, 9, 0, 0, 0),
	end:Time.new(2020, 11, 30, 11, 0, 0, 0)
)

Contact.create(
	admin_id: admin.id,
	title: "test",
	body: "test"
)