FactoryGirl.define do
  factory :label do
    sequence(:title) { |n| "ラベル#{n}" }
    published true
  end
end
