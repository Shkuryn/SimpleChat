# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chat do
  describe 'associations' do
    it { is_expected.to have_many(:messages).dependent(:destroy) }
  end

  describe 'callbacks' do
    let(:chat) { described_class.create }

    it 'broadcasts a prepend to chats after create' do
      expect { chat.save }.to have_broadcasted_to('chats')
    end
  end
end
