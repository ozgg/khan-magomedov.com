# frozen_string_literal: true

# User
#
# Attributes:
#   created_at [DateTime]
#   password_digest [String]
#   slug [String]
#   updated_at [DateTime]
class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :delete_all

  normalizes :slug, with: ->(e) { e.strip.downcase }

  validates :slug,
            presence: true,
            uniqueness: true
end
