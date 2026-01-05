FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email)    { |n| "user#{n}@example.com" }
    password { "password" }
    role { "user" }

    trait :admin do
      role { "admin" }
    end

    trait :moderator do
      role { "moderator" }
    end
  end
end
