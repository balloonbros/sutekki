require 'rails_helper'

RSpec.describe Idea, type: :model do
  let!(:published_idea) { create(:published_idea) }
  let!(:disabled_idea)  { create(:disabled_idea) }

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

  describe '#has_label?' do
    let(:idea) { create(:published_idea_with_label) }

    it 'returns true' do
      label_id = idea.labels.first.id
      expect(idea.has_label?(label_id)).to be true
    end

    it 'returns false' do
      label_id = idea.labels.first.id + 1
      expect(published_idea.has_label?(label_id)).to be false
    end
  end
end
