class UploadedFile < ApplicationRecord
  belongs_to :shop
  mount_uploader :file, UploadedFileUploader
  
  validates :name, presence: true
  validates :file_type, presence: true

  def getURL
    if self.file?
      self.file.url
    else
      self.url
    end
  end
end
