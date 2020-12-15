FactoryBot.define do
  factory :expense do
    parlamentarian { nil }
    date_issue { "2020-12-14" }
    provider { "MyString" }
    value { "9.99" }
    url_document { "MyText" }
  end
end
