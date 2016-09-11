require 'rails_helper'

RSpec.describe Link, type: :model do
  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }

    scenario "defaults to unread" do
      user = create(:user, email: "thisisanemail@gmail.com")
      link = Link.create(user: user, url: "https://www.google.com/", title: "My Fav")

      expect(link.read).to eq(false)
    end
  end
end
