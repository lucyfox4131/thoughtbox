require 'rails_helper'

RSpec.feature "User sorts" do
  let!(:user) { create(:user) }
  let!(:link1) { create(:link, user: user, title: "ATitle") }
  let!(:link2) { create(:link, user: user, title: "BTitle") }
  let!(:link3) { create(:link, user: user, title: "CTitle") }

  scenario "links alphabetically", :js => true do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit links_path

    click_on "Sort Alphabetically"

    rows = page.all('.link-row').collect(&:text)

    expect(rows.first).to include("ATitle")
    expect(rows.second).to include("BTitle")
    expect(rows.last).to include("CTitle")
  end
end
