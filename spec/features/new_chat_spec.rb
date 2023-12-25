# frozen_string_literal: true

require 'rails_helper'

feature 'Chat', :js do
  let(:chat_name) { 'test_chat' }
  let(:message) { 'test_message' }

  scenario 'Create a new chat' do
    visit '/'
    click_link 'New chat'

    expect(page).to have_content('Name')

    fill_in 'Name',	with: chat_name
    click_button 'Create Chat'

    expect(page).to have_content(chat_name)
    expect(Chat.count).to eq(1)
  end

  scenario 'Send a message' do
    visit '/'
    click_link 'New chat'
    fill_in 'Name',	with: chat_name
    click_button 'Create Chat'

    click_link chat_name
    fill_in 'Body',	with: message
    click_button 'Create Message'

    expect(page).to have_content(message)
    expect(Message.count).to eq(1)
  end
end
