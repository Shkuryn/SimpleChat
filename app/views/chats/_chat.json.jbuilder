# frozen_string_literal: true

json.extract! chat, :id, :name, :created_at, :updated_at
json.url chat_url(chat, format: :json)
