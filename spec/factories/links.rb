FactoryBot.define do
  factory :link do
    name { "My Link" }
    url { "https://mylink.com" }
    association :bio
  end
end
