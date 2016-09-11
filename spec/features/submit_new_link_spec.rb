require 'rails_helper'

RSpec.feature "User submits a new link" do
  scenario "authenticated user sees link submission form " do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit links_path
    expect(page).to have_content("New Link")

    fill_in "title", with: "My Lifeline"
    fill_in "url", with: "https://www.google.com/"
    click_on "Save"
  end

  scenario "link is invalid" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path
    expect(page).to have_content("New Link")

    fill_in "title", with: "My Lifeline"
    fill_in "url", with: "https://www.g"
    click_on "Save"
  end
end
