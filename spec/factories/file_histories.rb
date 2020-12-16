FactoryBot.define do
  factory :file_history do
    description { 'MyString' }
    file { FilesTestHelper.ceap_2020 }
    traits_for_enum :status, {
      pending: 0,
      success: 1,
      failure: 2
    }
  end
end
