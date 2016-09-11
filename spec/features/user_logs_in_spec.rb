require 'rails_helper'

RSpec.feature "User sees sign on" do
  scenario "They successfully log in" do
    visit '/'
    expect(page).to have_content("Log In or Sign Up")

    within ("nav") do
      click_button "Log In"
    end

    expect(page).to have_current_path(new_user_path)

    fill_in "Email", with: "lucyreneefox@gmail.com"
    fill_in "Password", with: "testpassword"
    fill_in "Password confirmation", with: "testpassword"

    click_button "Sign In"

    expect(page).to have_current_path(links_path)
    within("nav") do
      expect(page).to have_button("Log Out")
    end
  end
end
