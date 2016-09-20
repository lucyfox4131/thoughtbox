require 'rails_helper'

RSpec.feature "User changes link to read or unread", :js => true do
  let!(:user) { create(:user) }
  let!(:link) { create(:link, user: user, read: false) }

  scenario "Searches links" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within(".table") do
      expect(page).to have_content(link.title)
      expect(page).to have_content("unread")
    end

    expect(page).to have_content("Mark As Read")
    find(".read").click

    within(".table") do
      expect(page).to have_content("read")
      expect(page).to_not have_content("unread")
    end

    expect(page).to have_content("Mark As Unread")
    find(".unread").click

    within(".table") do
      expect(page).to have_content("unread")
    end
  end
end
