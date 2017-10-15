class Shop < ApplicationRecord
  belongs_to :companies
  has_many :uploaded_files
end
