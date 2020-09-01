class Property < ApplicationRecord
  has_and_belongs_to_many :facilities
  has_and_belongs_to_many :property_types
  has_many_attached :property_images

  def any_attached?
    ActiveStorage::Attachment.where(record_type: model_name.to_s, record_id: id).any?
  end
end
