require 'rails_helper'

RSpec.feature "User views and interacts with links via search buttons", :js => true do
  let!(:user) { create(:user) }
  let!(:links) { create_list(:link, 2, user: user) }
  let!(:read_link) { create(:link, user: user, read: true)}

  scenario "Searches links" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within(".table") do
      expect(page).to have_content(links.first.title)
      expect(page).to have_content(links.last.title)
      expect(page).to have_content(read_link.title)
    end

    click_on "Read Links"

    within(".table") do
      expect(page).to_not have_content(links.first.title)
      expect(page).to_not have_content(links.last.title)
      expect(page).to have_content(read_link.title)
    end

    click_on "All Links"

    within(".table") do
      expect(page).to have_content(links.first.title)
      expect(page).to have_content(links.last.title)
      expect(page).to have_content(read_link.title)
    end

    click_on "Unread Links"

    within(".table") do
      expect(page).to have_content(links.first.title)
      expect(page).to have_content(links.last.title)
      expect(page).to_not have_content(read_link.title)
    end
  end
end
