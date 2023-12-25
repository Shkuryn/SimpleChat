# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.belongs_to :chat, null: false, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
