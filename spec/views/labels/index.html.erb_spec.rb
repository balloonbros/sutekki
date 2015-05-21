require 'rails_helper'

RSpec.describe "labels/index", type: :view do
  before(:each) do
    assign(:labels, [
      Label.create!(
        :title => "Title",
        :published => false
      ),
      Label.create!(
        :title => "Title",
        :published => false
      )
    ])
  end

  it "renders a list of labels" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
