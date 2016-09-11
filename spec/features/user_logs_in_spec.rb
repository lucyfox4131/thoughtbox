require 'rails_helper'

RSpec.feature "User sees sign on" do
  scenario "successfully creates an account and logs out" do
    visit '/'
    expect(page).to have_content("Log In or Sign Up")

    within ("nav") do
      click_button "Log In Or Sign Up"
    end

    expect(page).to have_current_path(new_user_path)
  
    fill_in "Email", with: "lucyreneefox@gmail.com"
    fill_in "Password", with: "testpassword"
    fill_in "Password confirmation", with: "testpassword"

    click_button "Create Account"

    expect(page).to have_current_path(links_path)

    within("nav") do
      expect(page).to have_button("Log Out")
      click_button("Log Out")
    end

    expect(page).to have_current_path('/')
  end

  scenario "existing user can login" do
    user = create(:user)

  end
end
