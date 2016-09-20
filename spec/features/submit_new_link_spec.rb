require 'rails_helper'

RSpec.feature "User submits a new link" do
  scenario "authenticated user sees link submission form", :js => true do
    user = User.create(email: "lucille@gmail.com", password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit links_path

    expect(page).to have_content("New Link")

    fill_in "title", with: "My Lifeline"
    fill_in "url", with: "https://github.com/"
    click_button "Save"
  end

  scenario "link is invalid" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path
    expect(page).to have_content("New Link")

    fill_in "title", with: "My Lifeline"
    fill_in "url", with: "https://www.g"
    click_on "Save"

    expect(page).to have_content("Please enter a valid URL")
  end
end
