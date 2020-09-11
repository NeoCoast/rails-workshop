# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user_params) { { email: 'test@test.com', username: 'test' } }

  describe 'User creation' do
    it 'succeeds' do
      User.create(user_params)
      expect(User.count).to eq 1
    end

    context 'fails' do
      before do
        User.create(user_params)
      end

      it 'due to validations' do
        expect { User.create!(user_params) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
