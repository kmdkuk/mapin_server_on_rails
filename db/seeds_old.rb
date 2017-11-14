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
  )

company2 = Company.create(
  name: "函館の大学"
)

miraidai = company2.shops.create(
  name: "公立はこだて未来大学",
  image_url: "https://www.fun.ac.jp/control-panel/wp-content/uploads/2014/03/copy-top4.jpg",
  postal_code: "041-8655",
  address: "北海道函館市亀田中野町116番地2",
  tel: "0138-00-0000",
  business_hours: "10:00~17:00",
  category_id: college.id,
  homepage: "https://www.fun.ac.jp/"
)

sleep(5)

shop = company.shops.create(
  name: "イトーヨーカドー大井町店",
  image_url: "https://i.imgur.com/ihcWOPZ.png",
  postal_code: "140-0014",
  address: "東京都品川区大井１丁目３−６",
  tel: "03-3777-6611",
  business_hours: "10:00~22:00",
  category_id: market.id,
  homepage: "http://www.itoyokado.co.jp/"
)

sleep(5)

shop2 = company.shops.create(
  name: "セブンイレブン大井町店",
  image_url: "https://i.imgur.com/Rpphzc4.png",
  postal_code: "140-0014",
  address: "東東京都品川区 大井５－２－１１",
  tel: "03-3777-6611",
  business_hours: "２４時間営業",
  category_id: market.id,
  homepage: "http://www.sej.co.jp/"
)

files = Array.new

files.push(
  {
  name: "ダミー.pdf",
  url: "https://drive.google.com/file/d/0B5PMr_DG7mrec2dSOVV6clZtdGM/view?usp=sharing",
  file_type: "pdf"
  }
)

files.push(
  {
  name: "得の一チラシ.jpg",
  url: "https://drive.google.com/uc?export=download&id=0B5PMr_DG7mreV0JNT3VyS0NUcWM",
  file_type: "jpg"
  }
)

files.push(
  {
  name: "AP3.ppt",
  url: "https://drive.google.com/uc?export=download&id=0B_TYMLnAFlZTT0R6OGhjSVU5bjA",
  file_type: "ppt"
  }
)

files.push(
  {
  name: "bmp-sample.bmp",
  url: "https://drive.google.com/uc?export=download&id=0B_TYMLnAFlZTS3dhc3RzUDJRZnM",
  file_type: "bmp"
  }
)

files.push(
  {
  name: "学習フィードバック.doc",
  url: "https://drive.google.com/uc?export=download&id=0B_TYMLnAFlZTb2Q4ZVA2dmkyclk",
  file_type: "doc"
  }
)

files.push(
  {
  name: "text-sample.txt",
  url: "https://drive.google.com/uc?export=download&id=0B_TYMLnAFlZTaXpfRHBxb19DZ1U",
  file_type: "text"
  }
)

files.push(
  {
  name: "まっぴんプロダクトバックログ.xls",
  url: "https://drive.google.com/uc?export=download&id=0B_TYMLnAFlZTTzNUQVB4M1MwSGM",
  file_type: "xls"
  }
)

files.push(
  {
  name: "test.c",
  url: "https://drive.google.com/uc?export=download&id=0B5PMr_DG7mreV0JNT3VyS0NUcWM",
  file_type: "c"
  }
)

files.push(
  {
  name: "sample.mp4",
  url: "https://drive.google.com/file/d/0B5PMr_DG7mrec2dSOVV6clZtdGM/view?usp=sharing",
  file_type: "mp4"
  }
)

files.push(
  {
  name: "README.md",
  url: "https://drive.google.com/uc?export=download&id=0B5PMr_DG7mreV0JNT3VyS0NUcWM",
  file_type: "md"
  }
)

files.push(
  {
  name: "png-sample.png",
  url: "https://drive.google.com/uc?export=download&id=0B_TYMLnAFlZTQnM4OUN0RkIwUGs",
  file_type: "png"
  }
)

files.push(
  {
  name: "おでん広告.jpg",
  url: "https://drive.google.com/uc?export=download&id=0B5PMr_DG7mreN240ZnVHYXpZdnM",
  file_type: "jpg"
  }
)

files.push(
  {
  name: "gif-sample.gif",
  url: "https://drive.google.com/uc?export=download&id=0B_TYMLnAFlZTQXlxdGozdjhOaFU",
  file_type: "gif"
  }
)

files.push(
  {
  name: "AL-アイディア提案シート-テンプレ.xlsx",
  url: "https://drive.google.com/uc?export=download&id=0B_TYMLnAFlZTRWtwYzgzVWNYdzg",
  file_type: "xlsx"
  }
)

files.push(
  {
  name: "AP1.pptx",
  url: "https://drive.google.com/uc?export=download&id=0B_TYMLnAFlZTaGR1bkRUNzRvUmc",
  file_type: "pptx"
  }
)

files.push(
  {
  name: "MI-議事録-00-松山-0525-テンプレ案-ver2.1.docx",
  url: "https://drive.google.com/uc?export=download&id=0B_TYMLnAFlZTVGZEYjU1WWFRMjg",
  file_type: "docx"
  }
)

files.push(
  {
  name: "1-画像検索.pages",
  url: "https://drive.google.com/uc?export=download&id=0B_TYMLnAFlZTV19zNGtzbmE1TlE",
  file_type: "pages"
  }
)

files.push(
  {
  name: "スイーツカテゴリ数.numbers",
  url: "https://drive.google.com/uc?export=download&id=0B_TYMLnAFlZTYXhTeWxTeHNfRG8",
  file_type: "numbers"
  }
)

files.push(
  {
  name: "mapin.key",
  url: "https://drive.google.com/uc?export=download&id=0B_TYMLnAFlZTSXNGT1hVbUVTXzQ",
  file_type: "key"
  }
)

files.each do |file|
  miraidai.uploaded_files.create(file)
  shop.uploaded_files.create(file)
  shop2.uploaded_files.create(file)
end
