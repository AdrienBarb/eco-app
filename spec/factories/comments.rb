FactoryBot.define do
  factory :comment do
    comment { "MyText" }
    user { nil }
    project { nil }
  end
end
