require 'rails_helper'

RSpec.describe "Log in", :type => :feature do
  let(:user) { create(:user) }

  before do
    visit "/login"
    fill_in "session[email]", :with => user.email
    fill_in "session[password]", :with => user.password
    click_button "Log in"
  end

  it "displays the user's name after successful login" do
    expect(page).to have_content(user.name)
  end

  it "verifies the link after successful login" do
    expect(page).not_to have_link("Log in")
    expect(page).to have_link("Log out")
  end

  it "verifies the link after logout" do
    page.driver.submit :delete, logout_path, {}
    expect(page).to have_link("Log in")
    expect(page).not_to have_link("Log out")
  end
end
