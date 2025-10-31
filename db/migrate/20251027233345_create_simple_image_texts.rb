# frozen_string_literal: true

# Create table for simple image localized information
class CreateSimpleImageTexts < ActiveRecord::Migration[8.1]
  def change
    create_table :simple_image_texts, comment: 'Localized text for simple images' do |t|
      t.references :simple_image, null: false, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.references :language, null: false, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.string :alt_text, default: '', null: false, comment: 'Alternative text (for alt attribute)'
      t.string :caption, default: '', null: false, comment: 'Caption for figcaption'
      t.string :description, default: '', null: false, comment: 'Image description'
      t.timestamps
    end

    add_index :simple_image_texts, %i[simple_image_id language_id], unique: true
  end
end
