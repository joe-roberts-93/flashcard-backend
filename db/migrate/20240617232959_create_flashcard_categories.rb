class CreateFlashcardCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcard_categories do |t|
      t.references :flashcard, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
