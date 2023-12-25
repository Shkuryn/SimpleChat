# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :chat
  after_create_commit -> { broadcast_append_to 'messages' }
  validates :body, presence: true
end
