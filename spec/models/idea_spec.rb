require 'rails_helper'

RSpec.describe Idea, type: :model do
  let!(:published_idea) { Idea.create(title: "hello", body: "world", published: true) }
  let!(:disabled_idea)  { Idea.create(title: "hello", body: "world", published: false) }

  it "has and belongs to many labels" do
    expect(Idea.reflect_on_association(:labels).macro).to be == :has_and_belongs_to_many
  end

  describe "scope" do
    it 'fetch the published idea' do
      expect(Idea.published).to eq [published_idea]
    end

    it 'fetch the disabled idea' do
      expect(Idea.disabled).to eq [disabled_idea]
    end
  end

  describe "#disable" do
    it { expect{published_idea.disable}.to change{Idea.published.count}.from(1).to(0) }
    it { expect{published_idea.disable}.to change{Idea.disabled.count}.from(1).to(2) }
  end
end
