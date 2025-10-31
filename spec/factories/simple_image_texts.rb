# frozen_string_literal: true

FactoryBot.define do
  factory :simple_image_text do
    simple_image { nil }
    language { nil }
    alt_text { 'MyString' }
    caption { 'MyString' }
    description { 'MyString' }
  end
end
