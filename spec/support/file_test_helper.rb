module FilesTestHelper
  extend self
  extend ActionDispatch::TestProcess

  def ceap_2020
    upload('Ano-2020.csv', 'text/plain')
  end

  private

  def upload(name, type)
    file_path = Rails.root.join('spec', 'support', 'assets', name)
    fixture_file_upload(file_path, type)
  end
end
