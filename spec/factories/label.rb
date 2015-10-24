FactoryGirl.define do
  factory :label do
    sequence(:title) { |n| "label#{n}" }
    published true
  end
end
