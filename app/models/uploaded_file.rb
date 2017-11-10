class UploadedFile < ApplicationRecord
  belongs_to :shop
  mount_uploader :url, UploadedFileUploader
end
