FactoryBot.define do
  factory :client do
    email { Faker::Internet.email }
    phone_num { '1234567890' }
    first_name { Faker::Artist.name }
    last_name { Faker::Artist.name }
    password { 'password' }
  end
end
