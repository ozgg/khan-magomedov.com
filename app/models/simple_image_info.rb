# frozen_string_literal: true

# Localized information for simple image
#
# Attributes:
#   alt_text [String] Alternative text for alt attribute
#   caption [String] Caption for figcaption tag
#   created_at [DateTime]
#   description [String]
#   language_id [Language]
#   simple_image_id [SimpleImage]
#   updated_at [DateTime]
class SimpleImageInfo < ApplicationRecord
  belongs_to :simple_image
  belongs_to :language

  validates :alt_text, length: { maximum: 125 }
  validates :caption, length: { maximum: 250 }
  validates :language_id, uniqueness: { scope: %i[simple_image_id] }
end
