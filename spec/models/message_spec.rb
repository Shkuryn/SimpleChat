# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message do
  let(:chat) { Chat.create } # Создаем чат для тестирования связи

  describe 'associations' do
    it { is_expected.to belong_to(:chat) }
  end

  describe 'callbacks' do
    it 'broadcasts an append to messages after create' do
      message = described_class.new(chat:, body: 'Test message')
      expect { message.save }.to have_broadcasted_to('messages')
    end
  end
end
