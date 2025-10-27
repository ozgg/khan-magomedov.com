# frozen_string_literal: true

# Component
#
# Attributes:
#   created_at [DateTime]
#   settings [JSON]
#   slug [String]
#   updated_at [DateTime]
class Component < ApplicationRecord
  validates :slug,
            format: /\A[a-z][a-z_]{0,30}[a-z]\z/,
            uniqueness: true

  normalizes :slug, with: ->(v) { v.strip.downcase.gsub(/_(_+)/, '_') }
end
