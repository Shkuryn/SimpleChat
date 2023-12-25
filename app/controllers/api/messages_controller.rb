# frozen_string_literal: true

module Api
  class MessagesController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_chat

    def create
      @message = @chat.messages.new(message_params)
      if @message.save
        render json: @message, status: :created
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end

    private

    def set_chat
      @chat = Chat.find(params[:chat_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
  end
end
