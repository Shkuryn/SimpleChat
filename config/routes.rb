# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'chats#index'

  resources :chats do
    resources :messages
  end

  namespace :api do
    resources :chats, only: [:index] do
      resources :messages, only: [:create]
    end
  end
end
