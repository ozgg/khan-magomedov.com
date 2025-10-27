# frozen_string_literal: true

# Create table for components
class CreateComponents < ActiveRecord::Migration[8.1]
  def change
    create_table :components do |t|
      t.string :slug, null: false, index: { unique: true }
      t.jsonb :settings, default: {}, null: false
      t.timestamps
    end
  end
end
