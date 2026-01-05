FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "Movie #{n}" }
    description { "An English description for testing." }
    release_year { 1999 }
    association :director, factory: :person
  end
end
