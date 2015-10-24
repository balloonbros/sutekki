require 'rails_helper'

RSpec.describe IdeasLabel, type: :model do
  it "is invalid without a idea_id" do
    ideas_label = build(:ideas_label, idea_id: "")
    expect(ideas_label).to be_invalid
  end

  it "is invalid without a label_id" do
    ideas_label = build(:ideas_label, label_id: "")
    expect(ideas_label).to be_invalid
  end

  it "is invalid not unique" do
    ideas_label = create(:ideas_label)
    duplicate = build(:ideas_label, idea_id: ideas_label.idea_id, label_id: ideas_label.label_id)
    expect(duplicate).to be_invalid
  end
end
