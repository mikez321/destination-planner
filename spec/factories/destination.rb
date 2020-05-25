FactoryBot.define do
  factory :destination do
    name { Faker::Address.city }
    zip { Faker::Address.zip }
    description { Faker::Coffee.notes }
    image_url { Faker::Placeholdit.image }
  end
end
