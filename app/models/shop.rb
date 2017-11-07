class Shop < ApplicationRecord
  has_many :uploaded_files
  belongs_to :company
  belongs_to :category

  geocoded_by :address
  before_save :geocode
end
