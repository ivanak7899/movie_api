FactoryBot.define do
  factory :casting do
    association :movie
    association :person
    role_name { "Some Role" }
  end
end
