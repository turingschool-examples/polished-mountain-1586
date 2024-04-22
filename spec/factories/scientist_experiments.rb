FactoryBot.define do
  factory :scientist_experiment do
    association :scientist
    association :experiment
  end
end
