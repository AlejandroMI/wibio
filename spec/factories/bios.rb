# frozen_string_literal: true

FactoryBot.define do
  factory :bio do
    association :user
  end
end
