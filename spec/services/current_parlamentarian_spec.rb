require 'rails_helper'

RSpec.describe 'CurrentParlamentarian', type: :request do

  describe '#call' do
    context 'create parlamentarian' do
      let!(:params) do
        FakeRowsHelper.default(
          txNomeParlamentar: 'Daniel Vieira'
        )
      end
      subject { CurrentParlamentarian.new(params).call }

      it { expect(subject.name).to eq('Daniel Vieira')  }
      it { expect(subject).to eq(Parlamentarian.last) }
    end
  end
end