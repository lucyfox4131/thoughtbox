require 'rails_helper'

RSpec.feature "User sees sign on" do
  scenario "They successfully log in" do
    visit '/'
    expect(page).to have_content("Log In or Sign Up")

    click_button "Sign Up"
    expect(page).to have_current_path(new_user_path)

    fill_in "email", with: "lucyreneefox@gmail.com"
    fill_in "password", with: "testpassword"
    fill_in "password-confirmation", with: "testpassword"

    click_button "Log In"

    expect(page).to have_current_path(links_path)
    expect(page).to have_content("Sign Out")
  end
end
