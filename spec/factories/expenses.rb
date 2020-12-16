FactoryBot.define do
  factory :expense do
    parlamentarian

    sequence(:id_document) { |n| "My Coupon #{n}" }
    provider { Faker::Company.name }
    date_issue { '2020-06-01' }
    value { Faker::Commerce.price(range: 100.0..400.0) }
  end
end
