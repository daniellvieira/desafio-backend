require 'rails_helper'
RSpec.describe FileHistory, type: :model do
  context 'Enum' do
    it 'define enum for status' do
      is_expected.to define_enum_for(:status).with_values(
        pending: 0,
        success: 1,
        failure: 2
      )
    end
  end

  context 'Attached File' do
    let(:file_history) { create(:file_history) }
    it { expect(file_history.file).to be_attached }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:description) }
    context 'is a failure' do
      before { allow(subject).to receive(:failure?).and_return(true) }
      it { is_expected.to validate_presence_of(:message) }
    end
    context 'is not a failure' do
      before { allow(subject).to receive(:failure?).and_return(false) }
      it { is_expected.not_to validate_presence_of(:message) }
    end
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
