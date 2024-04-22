FactoryBot.define do
  factory :scientist do
    name { Faker::Name.unique.name }
    specialty { Faker::Job.field }
    university { Faker::University.name }
    association :lab
  end
end
