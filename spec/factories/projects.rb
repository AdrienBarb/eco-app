FactoryBot.define do
  factory :project do
    name { "MyString" }
    description { "MyText" }
    upvote { 1 }
    downvote { 1 }
    website_url { "MyString" }
    linkedin_url { "MyString" }
    twitter_url { "MyString" }
    facebook_url { "MyString" }
    instagram_url { "MyString" }
    user { nil }
  end
end
