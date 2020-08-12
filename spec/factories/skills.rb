FactoryBot.define do
  factory :skill do
    title { "Ruby on Rails" }
    description { "CRUD" }
    rate { 6 }
    user { nil }
  end
end
