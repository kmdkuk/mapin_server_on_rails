class UploadedFile < ApplicationRecord
  belongs_to :shop
  mount_uploader :file, UploadedFileUploader
  
  validates :name, presence: true
  validates :file_type, presence: true
end
