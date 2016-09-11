require 'rails_helper'

RSpec.feature "User submits a new link" do
  scenario "authenticated user sees link submission form " do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    visit links_path
    expect(page).to have_content("Submit A Link")

    fill_in "Title", with: "My Lifeline"
    fill_in "Url", with: "https://www.google.com/"
    #every link has a read or unread status
    click_on "Create New Link"

    visit links_path
    expect(page).to have_content("My Lifeline")
  end
end

# The Link model should include:
#
# A valid URL location for the link
# A title for the link
# Additionally, all links have a read status that is either true or false. This column will default to false.
#
# Submitting an invalid link should result in an error message being displayed.
#
# Once a link has been submitted, loading the index page should display all of my links.
