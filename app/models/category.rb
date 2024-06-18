class Category < ApplicationRecord
  has_many :flashcard_categories
  has_many :flashcards, through: :flashcard_categories
end
