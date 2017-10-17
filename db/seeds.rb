# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
college = Category.create(name: "大学")
market = Category.create(name: "スーパーマーケット")

company = Company.create(
  name: "7&iホールディングス",
  name_kana: "セブンアンドアイホールディングス",
  location: "東京都千代田区二番町8番地8",
  location_kana: "とうきょうとちよだく",
  responsible_person: "井阪　隆一",
  responsible_person_kana: "いさか　りゅういち",
  email: "sample@example.com",
  phonenumber: "090-1234-5678"
  )

shop = Shop.create(
  image: "https://i.imgur.com/ihcWOPZ.png",
  address: "東京都品川区大井１丁目３−６",
  tel: "03-3777-6611",
  hours_begin: "10:00:00",
  hours_end: "22:00:00",
  categories_id: market.id,
  companies_id: company.id,
  homepage: "http://www.itoyokado.co.jp/"
)

UploadedFile.create(
  name: "ダミー.pdf",
  url: "https://drive.google.com/file/d/0B5PMr_DG7mrec2dSOVV6clZtdGM/view?usp=sharing",
  file_type: "pdf",
  shops_id: shop.id
)

