# frozen_string_literal: true

# Simple image for entity
#
# Attributes:
#   component_id [Component] Component for grouping in libraries
#   created_at [DateTime]
#   image_data [JSON] Image data for Shrine
#   updated_at [DateTime]
#   uuid [UUID]
class SimpleImage < ApplicationRecord
  include HasUuid
  include SimpleImageUploader::Attachment(:image)

  belongs_to :component, optional: true
  has_many :simple_image_infos, dependent: :delete_all
end
