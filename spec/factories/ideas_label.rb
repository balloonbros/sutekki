FactoryGirl.define do
  factory :ideas_label do
    sequence(:idea_id) { |n| n }
    sequence(:label_id) { |n| n }
  end
end
