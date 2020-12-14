require 'rails_helper'
RSpec.describe FileHistory, type: :model do
  context 'Enum' do
    it 'define enum for status' do
      should define_enum_for(:status).with_values(
        pending: 0,
        success: 1,
        failure: 2
      )
    end
  end

  context 'Attached File' do
    let(:file_history) { create(:file_history, :with_file) }
    it { expect(file_history.file).to be_attached }
  end

  context 'Validations' do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:description) }
  end

  context 'with a valid file' do
    before(:each) do
      @file_history = create(:file_history)
    end

    it 'is attached' do
      @file_history.file.attach(
        io: File.open(Rails.root.join('spec', 'support', 'assets', 'Ano-2020.csv')),
        filename: 'filename.xlsx',
        content_type: 'application/xlsx'
      )
      expect(@file_history.file).to be_attached
    end
  end


end
