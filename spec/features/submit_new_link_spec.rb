require 'rails_helper'

RSpec.feature "User submits a new link" do
  scenario "authenticated user sees link submission form " do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit links_path
    expect(page).to have_content("Submit A Link")

    fill_in "Title", with: "My Lifeline"
    fill_in "Url", with: "https://www.google.com/"
    click_on "Create New Link"

    expect(page).to have_content("My Lifeline")
  end
end

# Submitting an invalid link should result in an error message being displayed.
