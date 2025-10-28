# frozen_string_literal: true

# Create table for storing simple images
class CreateSimpleImages < ActiveRecord::Migration[8.1]
  def change
    create_table :simple_images, comment: 'Simple images for entities in components' do |t|
      t.uuid :uuid, null: false, index: { unique: true }
      t.references :component, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.jsonb :image_data, null: false, default: {}, index: { type: :gin }, comment: 'Metadata for shrine'
      t.timestamps
    end
  end
end
