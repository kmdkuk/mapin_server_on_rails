require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @company = Company.new(name: "Example Company")
  end

  test "should be valid" do
    assert @company.valid?
  end

  test "name should be present" do
    @company.name = " "
    assert_not @company.valid?
  end

  test "associated shops should be destroyed" do
    @company.save
    @company.shops.create!(name: "Example shop", image_url: "testURL",
                          postal_code: "000-0000", address: "北海道札幌市北区北18条西6丁目",
                          tel: "090-0000-0000", business_hours: "24時間営業",
                          homepage: "testURL", category: Category.first)
    assert_difference 'Shop.count', -1 do
      @company.destroy
    end
  end
end
