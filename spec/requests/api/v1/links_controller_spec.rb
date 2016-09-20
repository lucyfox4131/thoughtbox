require 'rails_helper'

describe "Links Controller" do
  it "gets all links" do
    user = create(:user, email: "thisisnew@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )
    link1 = Link.create(user: user, title: "Google", url: "https://www.google.com")
    link2 = Link.create(user: user, title: "Twitter", url: "https://twitter.com/")

    get '/api/v1/links'

    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json.first["title"]).to eq(link2.title)
    expect(json.first["url"]).to eq(link2.url)
  end

  it "only gets links for current user" do
    user = create(:user, email: "thisisnew@gmail.com")
    user2 = create(:user, email: "thisisuser2@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )
    link1 = Link.create(user: user, title: "Google", url: "https://www.google.com")
    link2 = Link.create(user: user2, title: "Twitter", url: "https://twitter.com/")

    get '/api/v1/links'

    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json.last["title"]).to eq(link1.title)
    expect(json.last["url"]).to eq(link1.url)
    expect(json).to_not include(link2.title)
  end

  it "creates a new link" do
    user = create(:user, email: "thisisuser2@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )

    params = {link: {title: "New Link", url: "https://www.google.com"}}

    expect(user.links.count).to eq(0)

    post '/api/v1/links', params: params

    expect(response).to be_success
    expect(user.links.count).to eq(1)

    expect(user.links.first.title).to eq("New Link")
    expect(user.links.first.url).to eq("https://www.google.com")
  end

  it "updates an existing link title" do
    user = create(:user, email: "thisisuser2@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )
    link = Link.create(user: user, title: "Old title", url: "https://www.google.com")

    id = link.id
    put "/api/v1/links/#{id}", params: {link: {title: "New Title"}}

    expect(response).to be_success
    updated_link = Link.find(id)

    expect(updated_link.title).to eq("New Title")
  end

  it "updates an existing link title" do
    user = create(:user, email: "thisisuser2@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )
    link = Link.create(user: user, title: "Twitter", url: "https://www.google.com")

    id = link.id
    put "/api/v1/links/#{id}", params: {link: {url: "https://twitter.com/"}}

    expect(response).to be_success
    updated_link = Link.find(id)

    expect(updated_link.url).to eq("https://twitter.com/")
  end

  it "can't update with invalid urls" do
    user = create(:user, email: "thisisuser2@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return( user )
    link = Link.create(user: user, title: "Old title", url: "https://www.google.com")

    id = link.id
    patch "/api/v1/links/#{id}", params: {link: {url: "https://w"}}
  end
end
