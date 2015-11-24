FactoryGirl.define do
  factory :user do
    name "sutekki"
    sequence(:email) { |n| "person#{n}@example.com" }
    status 0
  end
end
