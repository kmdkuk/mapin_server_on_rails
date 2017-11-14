college = Category.create(name: "大学")
market = Category.create(name: "スーパーマーケット")

company_seven = Company.create(name: "7&iホールディングス")
company_college = Company.create(name: "公立はこだて未来大学")

miraidai = company_college.shops.create(
  name: "函館キャンパス",
  image_url: "https://www.fun.ac.jp/control-panel/wp-content/uploads/2014/03/copy-top3.jpg",
  postal_code: "041-8655",
  address: "北海道函館市亀田中野町116番地2",
  tel: "0138-00-0000",
  business_hours: "10:00~17:00",
  category_id: college.id,
  homepage: "https://www.fun.ac.jp/"
)

sleep(5)

seven11 = company_seven.shops.create(
  name: "函館富岡町店",
  image_url: "http://jice.homemate-navi.com/pubuser1/pubuser_facility_img/7/4/1/00000000000000015147/0000001783/00000000000000015147_0000001783_1.jpg",
  postal_code: "041-0811",
  address: "北海道函館市富岡町2丁目45-11",
  tel: "0138-00-0000",
  business_hours: "24時間",
  category_id: market.id,
  homepage: "http://www.sej.co.jp/"
)

