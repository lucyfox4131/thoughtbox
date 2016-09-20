require 'rails_helper'

RSpec.feature "User views and interacts with links" do
  # xbefore (:each) do
  #   @user = create(:user, email: "lucille@gmail.com", password: "Password")
  #   @link1 = Link.create(user_id: @user.id, title: "A Title", url: "https://www.google.com/", read: false)
  #   @link2 = Link.create(user_id: @user.id, title: "B Title", url: "http://www.stackoverflow.com/", read: false)
  #   @link3 = Link.create(user_id: @user.id, title: "C Title", url: "https://twitter.com", read: true)
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  # end
  #
  # xscenario "Searches links", :js => true do
  #
  #   visit links_path
  #
  #   expect(page).to have_content(@link1.title)
  #   expect(page).to have_content(@link2.title)
  #   expect(page).to have_content(@link3.title)
  #
  #
  #
  # end
end
