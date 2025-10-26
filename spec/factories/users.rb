# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:slug) { |i| "user#{i}" }
    password { 'password' }
  end
end
