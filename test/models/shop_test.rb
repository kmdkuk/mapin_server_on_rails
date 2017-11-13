require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  def setup
    @company = companies(:one)
    @shop = @company.shops.build(name: "Example shop", image_url: "testURL",
                          postal_code: "000-0000", address: "北海道札幌市北区北18条西6丁目",
                          tel: "090-0000-0000", business_hours: "24時間営業",
                          homepage: "testURL", category_id: Category.first.id)
  end
  
  test "should be valid" do
    assert @shop.valid?
  end
  
  test "name should be present" do
    @shop.name = " "
    assert_not @shop.valid?
  end
  
  test "image_url should be present" do
    @shop.image_url = ""
    assert_not @shop.valid?
  end
  
  test "postal_code should be present" do
    @shop.postal_code = ""
    assert_not @shop.valid?
  end
  
  test "address should be present" do
    @shop.address = ""
    assert_not @shop.valid?
  end
  
  test "tel should be present" do
    @shop.tel = ""
    assert_not @shop.valid?
  end
  
  test "associated uploaded_files should be destroy" do
    @shop.save
    @shop.uploaded_files.create!(name: "testfile", url: "http://testfile", file_type: "pdf")
    assert_difference 'UploadedFile.count', -1 do
      @shop.destroy
    end
  end
end