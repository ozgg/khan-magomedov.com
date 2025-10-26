# frozen_string_literal: true

class CreateSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :sessions do |t|
      t.references :user, null: false, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.inet :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
