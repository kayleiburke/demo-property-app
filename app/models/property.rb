class Property < ApplicationRecord
  has_and_belongs_to_many :facilities
  has_and_belongs_to_many :property_types
  has_many_attached :property_images
end
