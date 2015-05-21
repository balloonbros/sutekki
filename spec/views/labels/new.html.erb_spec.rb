require 'rails_helper'

RSpec.describe "labels/new", type: :view do
  before(:each) do
    assign(:label, Label.new(
      :title => "MyString",
      :published => false
    ))
  end

  it "renders new label form" do
    render

    assert_select "form[action=?][method=?]", labels_path, "post" do

      assert_select "input#label_title[name=?]", "label[title]"

      assert_select "input#label_published[name=?]", "label[published]"
    end
  end
end
