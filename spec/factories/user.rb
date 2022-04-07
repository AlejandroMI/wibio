FactoryBot.define do
  factory :user do
    email { 'whatever@gem.com' }
    password { 'superSecret' }
    password_confirmation { 'superSecret' }
  end
end
