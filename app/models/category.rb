class Category < ApplicationRecord
  has_many :flashcard_categories, dependent: :destroy
  has_many :flashcards, through: :flashcard_categories
end
