FactoryBot.define do
  factory :user do
    nickname { 'graham' }
    full_name { 'Graham Whatever' }
    email { 'whatever@gem.com' }
    password { 'superSecret' }
    password_confirmation { 'superSecret' }
  end
end
