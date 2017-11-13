require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  def setup
    @company = companies(:one)
    @shop = @company.shops.build(name: "Example shop", image_url: "testURL",
                          postal_code: "000-0000", address: "北海道札幌市北区北18条西6丁目",
                          tel: "090-0000-0000", business_hours: "24時間営業",
                          homepage: "testURL", category: Category.first)
  end
  
  test "should be valid" do
    assert @shop.valid?
  end
end
