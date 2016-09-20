require 'rails_helper'

RSpec.feature "User views and interacts with links", :js => true do
  let!(:user) { create(:user) }
  let!(:links) { create_list(:link, 3, user: user) }

  xscenario "Searches links" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path
    expect(page).to have_content("ThoughtBox")
    expect(user.links.count).to eq(3)

    within(".table") do
      expect(page).to have_content(links.first.title)
      expect(page).to have_content(links.second.title)
      expect(page).to have_content(links.last.title)
    end

    first_letter = links.first.title.first

    find("input[name='search[filter]']").set(first_letter)

    within(".table") do
      expect(page).to have_content(links.first.title)
      expect(page).to_not have_content(links.second.title)
      expect(page).to_not have_content(links.last.title)
    end
  end
end
