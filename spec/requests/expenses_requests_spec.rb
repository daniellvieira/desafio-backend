require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  context "GET /index" do
    let!(:parlamentarian) { create(:parlamentarian) }
    let(:url) { "/parlamentarians/#{parlamentarian.id}/expenses" }

    context 'without any params' do
      let!(:expenses) { create_list(:expense, 10, parlamentarian: parlamentarian) }
      before { get url }

      it { expect(assigns(:expenses).count).to eq 10 }
      it { expect(assigns(:top7_expenses).count).to exist }
      it { expect(assigns(:month_chart).count).to exist }
      it { expect(assigns(:provider_chart).count).to exist }

      it 'returns 10 first Expenses' do
        expected_expenses = expenses[0..9]
        expect(assigns(:expenses)).to contain_exactly *expected_expenses
      end
    end
  end
end
