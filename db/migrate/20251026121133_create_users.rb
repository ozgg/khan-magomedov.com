# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :slug, null: false, collation: 'C', index: { unique: true }
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
