require 'rails_helper'

RSpec.describe "labels/edit", type: :view do
  before(:each) do
    @label = assign(:label, Label.create!(
      :title => "MyString",
      :published => false
    ))
  end

  it "renders the edit label form" do
    render

    assert_select "form[action=?][method=?]", label_path(@label), "post" do

      assert_select "input#label_title[name=?]", "label[title]"

      assert_select "input#label_published[name=?]", "label[published]"
    end
  end
end
