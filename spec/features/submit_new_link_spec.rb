require 'rails_helper'

RSpec.feature "User submits a new link" do
  let!(:user) { create(:user) }
  let!(:links) { create_list(:link, 3, user: user) }

  scenario "authenticated user sees link submission form", :js => true do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit links_path

    expect(page).to have_content("New Link")

    fill_in "title", with: "My Lifeline"
    fill_in "url", with: "https://github.com/"
    click_button "Save"

    expect(page).to have_content("My Lifeline")
    expect(page).to have_content("https://github.com/")
  end

  scenario "link is invalid", js: true do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path
    expect(page).to have_content("New Link")

    fill_in "title", with: "My Lifeline"
    fill_in "url", with: "https://www.g"
    click_on "Save"

    within(".alert") do
      expect(page).to have_content("Please enter a valid URL")
    end
  end
end
