# require 'rails_helper'
#
# RSpec.describe 'ProcessFileService', type: :request do
#   describe '#call' do
#     context 'create expenses and create parlamentarian' do
#       let(:file_history) { create(:file_history, status: :pending) }
#       before do
#         puts file_history.attributes
#         ProcessFileService.new(file_history.id).call
#         puts file_history.attributes
#       end
#       it { expect(Parlamentarian.count).to eq(1) }
#       it { expect(Expense.count).to eq(5) }
#       it { expect(file_history.success?).to be_truthy }
#     end
#   end
# end