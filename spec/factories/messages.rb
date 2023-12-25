# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    chat { nil }
    body { 'message_body' }
  end
end
