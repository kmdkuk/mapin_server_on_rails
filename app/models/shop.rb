class Shop < ApplicationRecord
  belongs_to :company
  has_one :category
end
