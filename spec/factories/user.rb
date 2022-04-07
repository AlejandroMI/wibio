FactoryBot.define do
  factory :user do
    nickname { 'graham' }
    email { 'whatever@gem.com' }
    password { 'superSecret' }
    password_confirmation { 'superSecret' }
  end
end
