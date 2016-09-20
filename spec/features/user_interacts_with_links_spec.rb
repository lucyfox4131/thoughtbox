require 'rails_helper'

RSpec.feature "User views and interacts with links", :js => true do
  let!(:user) { create(:user) }
  let!(:links) { create_list(:link, 2, user: user) }
  let!(:search_link){ create(:link, user: user, title: "SearchableLink")}

  scenario "Searches links" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path
    expect(page).to have_content("ThoughtBox")

    within(".table") do
      expect(page).to have_content(links.first.title)
      expect(page).to have_content(links.second.title)
      expect(page).to have_content(search_link.title)
    end

    find("input[name='search[filter]']").set("Sea")

    within(".table") do
      expect(page).to have_content(search_link.title)
      expect(page).to_not have_content(links.first.title)
      expect(page).to_not have_content(links.last.title)
    end
  end
end
