class FlashcardCategory < ApplicationRecord
  belongs_to :flashcard
  belongs_to :category
end
