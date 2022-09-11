# frozen_string_literal: true

FactoryBot.define do
  factory :link do
    name { "My Link" }
    url { "https://mylink.com" }
    association :bio
  end
end
