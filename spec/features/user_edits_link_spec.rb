require 'rails_helper'

RSpec.feature "User edits" do
  let!(:user) { create(:user) }
  let!(:link) { create(:link, user: user) }

  scenario "authenticated user edits link", :js => true do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit links_path

    new_title = "Brand New Title"
    original_title = link.title

    within(".table") do
      expect(page).to have_content(original_title)
      expect(page).to have_content(link.url)
    end

    find(".edit").click
    title_box = find(".title")
    title_box.set(new_title)

    find(".fa-floppy-o").click

    within(".title") do
      expect(page).to have_content(new_title)
      expect(page).to_not have_content(original_title)
    end
  end
end
