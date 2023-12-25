# frozen_string_literal: true

module Api
  class ChatsController < ApplicationController
    def index
      @chats = Chat.all
      render json: @chats
    end
  end
end
