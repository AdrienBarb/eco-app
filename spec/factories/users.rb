FactoryBot.define do
  factory :user do

    first_name {"Adrien"}
    last_name {"Barbier"}
    phone_number {"06 79 09 38 18"}
    city {"Pont de roide"}
    zip_code {25150}
    country {"France"}
    url_linkedin {"https://www.linkedin.com/in/adrien-barbier-5b479598/"}
    sequence(:email) { |n| "test#{n}@example.com" }
    password {"password"}

    trait :admin do
      admin {true}
    end
  end
end
