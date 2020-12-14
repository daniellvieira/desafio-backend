FactoryBot.define do
  factory :file_history do
    description { 'MyString' }
    traits_for_enum :status, {
      pending: 0,
      success: 1,
      failure: 2
    }
    trait :with_file do
      file { FilesTestHelper.ceap_2020 }
    end
  end
end
