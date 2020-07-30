FactoryBot.define do
  factory :project do
    name { "Super projet" }
    description { "Une voiture volante" }
    upvote { 1 }
    downvote { 1 }
    website_url { "www.baba.com" }
    linkedin_url { "www.baba.com" }
    twitter_url { "www.baba.com" }
    facebook_url { "www.baba.com" }
    instagram_url { "www.baba.com" }
    user { nil }
    category { nil }
  end
end
