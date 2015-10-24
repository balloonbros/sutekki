FactoryGirl.define do
  factory :idea do
    title 'hello'
    body 'world'

    trait :published do
      published true
    end

    trait :disabled do
      published false
    end

    trait :with_label do
      after(:create) do |idea|
        idea.labels << FactoryGirl.create(:label)
      end
    end

    factory :published_idea, traits: [:published]
    factory :published_idea_with_label, traits: [:published, :with_label]
    factory :disabled_idea, traits: [:disabled]
    factory :disabled_idea_with_label, traits: [:disabled, :with_label]
  end
end
