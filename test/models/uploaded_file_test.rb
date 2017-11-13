require 'test_helper'

class UploadedFileTest < ActiveSupport::TestCase
  def setup
    @shop = shops(:one)
    @file = @shop.uploaded_files.build(name: "testfile", url: "http://testfile", file_type: "pdf")
  end
end
