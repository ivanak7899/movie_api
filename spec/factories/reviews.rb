FactoryBot.define do
  factory :review do
    association :movie
    association :user
    rating { 8 }
    comment { "Solid movie, would watch again." }
  end
end
