FactoryGirl.define do
  sequence(:email) { |n| "lucille#{n}@gmail.com"}
  sequence(:title) { |n| "#{n} Title" }
  sequence(:url) { |n| "http://www.google.com/#{n}" }

  factory :user do
    email
    password "Password"
    password_confirmation "Password"
  end

  factory :link do
    title
    url
    user
  end
end
