# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API Chats' do
  describe 'GET /api/chats' do
    let(:first_chat) { Chat.create(name: 'Chat 1') }
    let(:second_chat) { Chat.create(name: 'Chat 2') }

    before do
      first_chat
      second_chat
    end

    it 'returns all chats', :aggregate_failures do
      get '/api/chats'

      expect(response).to have_http_status(:ok)

      json_response = response.parsed_body
      expect(json_response.size).to eq(2)
      expect(json_response[0]['name']).to eq('Chat 1')
      expect(json_response[1]['name']).to eq('Chat 2')
    end
  end

  describe 'POST /api/chats/:chat_id/messages' do
    let(:chat) { Chat.create(name: 'Test Chat') }
    let(:valid_body) { { body: 'Test message' } }
    let(:invalid_body) { { body: '' } }

    context 'when the request is valid' do
      it 'creates a message', :aggregate_failures do
        post "/api/chats/#{chat.id}/messages", params: { message: valid_body }

        expect(response).to have_http_status(:created)
        expect(response.parsed_body['body']).to eq('Test message')
      end
    end

    context 'when the request is invalid' do
      it 'does not create a message' do
        post "/api/chats/#{chat.id}/messages", params: { message: invalid_body }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
