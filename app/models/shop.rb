class Shop < ApplicationRecord
  has_many :uploaded_files, dependent: :destroy
  belongs_to :company
  belongs_to :category

  geocoded_by :address
  after_validation :geocode, if: lambda {|obj| obj.address_changed?}

  validates :name, presence: true
  validates :image_url, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :tel, presence: true
end
