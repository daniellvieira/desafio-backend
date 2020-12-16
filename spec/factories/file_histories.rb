FactoryBot.define do
  factory :file_history do
    description { 'MyString' }
    file { FilesTestHelper.test_csv_ceap }
    traits_for_enum :status, {
      pending: 0,
      success: 1,
      failure: 2
    }
  end
end
