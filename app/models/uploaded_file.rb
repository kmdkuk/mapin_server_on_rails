class UploadedFile < ApplicationRecord
  belongs_to :shop
  mount_uploader :file, UploadedFileUploader

  def getURL
    if self.file?
      self.file.url
    else
      self.url
    end
  end
end
