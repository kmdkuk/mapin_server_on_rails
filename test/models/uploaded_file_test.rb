require 'test_helper'

class UploadedFileTest < ActiveSupport::TestCase
  def setup
    @shop = shops(:one)
    @file = @shop.uploaded_files.build()
  end
  
  test "should be valid" do
    assert @file.valid?
  end
  
  test "name should be present" do
    @file.name = ""
    assert_not @file.valid?
  end
  
  test "file_type should be present" do
    @file.file_type = ""
    assert_not @file.valid?
  end
end
