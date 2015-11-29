require 'rails_helper'

RSpec.describe "home page", :type => :feature do
  it "displays the user's name after successful login" do
    user = create(:user)
    visit "/login"
    fill_in "session[email]", :with => user.email
    fill_in "session[password]", :with => user.password
    click_button "Log in"

    has_text?(user.name)
  end

  it "not displays the link to login after successful login" do
    user = create(:user)
    visit "/login"
    fill_in "session[email]", :with => user.email
    fill_in "session[password]", :with => user.password
    click_button "Log in"

    has_link?("login")
  end
end
