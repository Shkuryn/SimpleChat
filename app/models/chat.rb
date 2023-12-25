# frozen_string_literal: true

class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy
  after_create_commit -> { broadcast_prepend_to 'chats' }
end
