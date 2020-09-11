# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'POST /api/v1/users' do
    let!(:headers) { { 'ACCEPT' => 'application/json' } }

    before do
      post '/api/v1/users', params: { email: 'test@email.com', username: 'testuser' }, headers: headers
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'creates an user' do
      expect(User.count).to eq 1
    end
  end
end
