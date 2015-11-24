FactoryGirl.define do
  factory :user do
    name "sutekki"
    sequence(:email) { |n| "person#{n}@example.com" }
    status 0
    password "foobar78"
    password_confirmation "foobar78"
  end
end
