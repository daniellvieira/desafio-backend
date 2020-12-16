require 'rails_helper'

RSpec.describe Expense, type: :model do

  describe 'Associations' do
    it { is_expected.to belong_to(:parlamentarian).required }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:id_document) }
  end

  context 'Method for Expense' do
    let(:parlamentarian) { create(:parlamentarian) }

    context '.top' do
      let(:expense1) { create(:expense, value: 20.0) }
      let(:expense2) { create(:expense, value: 10.0) }
      let(:expense3) { create(:expense, value: 15.0) }
      it 'returns top 1 expenses' do
        expect(Expense.top(1)).to match_array [expense1]
      end
      it 'returns top 2 expenses' do
        expect(Expense.top(2)).to match_array [expense1, expense3]
      end
      it 'returns top 3 expenses' do
        expect(Expense.top(3)).to match_array [expense1, expense3, expense2]
      end
    end

    context '.chart_top_providers' do
      let!(:expense1) { create(:expense, provider: 'provider1', value: 20.0) }
      let!(:expense2) { create(:expense, provider: 'provider2', value: 40.0) }
      let!(:expense3) { create(:expense, provider: 'provider3', value: 30.0) }
      let!(:expense4) { create(:expense, provider: 'provider4', value: 50.0) }
      let!(:expense5) { create(:expense, provider: 'provider1', value: 40.0) }

      context 'top 3 providers' do
        let(:expenses) { Expense.chart_top_providers(3) }
        it { expect(expenses.keys).to contain_exactly *%w[provider1 provider4 provider2] }
        it { expect(expenses.values).to contain_exactly *[60.0, 50.0, 40.0] }
      end
      context 'top 2 providers' do
        let(:expenses) { Expense.chart_top_providers(2) }
        it { expect(expenses.keys).to contain_exactly *%w[provider1 provider4] }
        it { expect(expenses.values).to contain_exactly *[60.0, 50.0] }
      end
    end

    context '.chart_by_month' do
      let!(:expense1) { create(:expense, date_issue: '2020-10-05', value: 20.0) }
      let!(:expense2) { create(:expense, date_issue: '2020-09-05', value: 40.0) }
      let!(:expense3) { create(:expense, date_issue: '2020-07-05', value: 30.0) }
      let!(:expense4) { create(:expense, date_issue: '2020-11-05', value: 50.0) }
      let!(:expense5) { create(:expense, date_issue: '2020-09-05', value: 40.0) }
      let(:expenses) { Expense.chart_by_month }

      let(:array_result) do
        [ ["janeiro", 0],
          ["fevereiro", 0],
          ["março", 0],
          ["abril", 0],
          ["maio", 0],
          ["junho", 0],
          ["julho", 30.0],
          ["agosto", 0],
          ["setembro", 80.0],
          ["outubro", 20.0],
          ["novembro", 50.0],
          ["dezembro", 0]
        ]
      end
      it { expect(expenses.size).to eq 12 }
      it { expect(expenses).to match_array array_result }
    end
  end
end