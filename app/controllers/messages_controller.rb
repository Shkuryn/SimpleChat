# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @chat = @message.chat

    respond_to do |format|
      if @message.save
        format.html do
          redirect_to chat_message_url(@message.chat, @message), notice: 'Message was successfully created.'
        end
        format.json { render :show, status: :created, location: @message }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :chat_id)
  end
end
