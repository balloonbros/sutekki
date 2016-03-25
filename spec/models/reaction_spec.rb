require 'rails_helper'

RSpec.describe Reaction, type: :model do

  it "is invalid without a idea_id" do
    reaction = build(:reaction, idea_id: "")
    expect(reaction).to be_invalid
  end

  it "is invalid without a user_id" do
    reaction = build(:reaction, user_id: "")
    expect(reaction).to be_invalid
  end

  it "is invalid not unique" do
    reaction = create(:reaction)
    duplicate = build(:reaction, idea_id: reaction.idea_id,
                                 user_id: reaction.user_id,
                                 action: reaction.action)
    expect(duplicate).to be_invalid
  end

end
