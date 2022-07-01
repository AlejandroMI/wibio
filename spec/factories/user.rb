# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "human#{n}" }
    full_name { "Human Earth" }
    email { "#{nickname}@test.com" }
    password { "superSecret" }
    password_confirmation { "superSecret" }

    trait :with_avatar do
      avatar { Rack::Test::UploadedFile.new("spec/fixtures/monalisa.jpeg", "image/png") }
    end
  end
end
