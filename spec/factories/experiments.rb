FactoryBot.define do
  factory :experiment do
    name { Faker::Science.element }
    objective { Faker::Lorem.sentence }
    num_months { rand(1..12) }
  end
end
