require 'rails_helper'

RSpec.describe 'FileHistories', type: :request do
  context 'POST /file_histories' do
    let(:url) { '/file_histories' }
    context 'with valid params' do
      let(:file_history_params) { { file_history: attributes_for(:file_history, :with_file) } }

      it 'adds a new FileHistory' do
        expect do
          post url, params: file_history_params
        end.to change(FileHistory, :count).by(1)
      end

      it 'creates a blob' do
        expect do
          post url, params: file_history_params
        end.to change { ActiveStorage::Blob.count }.by(1)
      end

      it 'not return error message' do
        post url, params: file_history_params
        expect(assigns(:file_history).errors.empty?).to be_truthy
      end

      it 'returns success status' do
        post url, params: file_history_params
        expect(response).to have_http_status(:found) # 302
      end
    end

    context 'with invalid params' do
      let(:file_history_invalid_params) do
        { file_history: attributes_for(:file_history, :with_file, description: nil) }
      end

      it 'does not add a new FileHistory' do
        expect do
          post url, params: file_history_invalid_params
        end.to_not change(FileHistory, :count)
      end

      it 'returns error message' do
        post url, params: file_history_invalid_params
        expect(assigns(:file_history).errors.empty?).to be_falsey
      end
    end
  end
end
