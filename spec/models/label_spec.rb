require 'rails_helper'

RSpec.describe Label, type: :model do
  it "has and belongs to many ideas" do
    expect(Label.reflect_on_association(:ideas).macro).to be == :has_and_belongs_to_many
  end
end
