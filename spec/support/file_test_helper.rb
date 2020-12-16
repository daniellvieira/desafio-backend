module FilesTestHelper
  extend self
  extend ActionDispatch::TestProcess

  def test_csv_ceap
    upload('Ano-20201.csv', 'text/csv')
  end

  private

  def upload(name, type)
    file_path = Rails.root.join('spec', 'support', 'assets', name)
    fixture_file_upload(file_path, type)
  end

  # def upload(name, type)
  #   file_path = Rails.root.join('spec', 'support', 'assets', name)
  #   ActiveStorage::Blob.create_after_upload!(
  #     io: File.open(file_path, 'rb'),
  #     filename: name,
  #     content_type: type
  #   )
  # end
end
