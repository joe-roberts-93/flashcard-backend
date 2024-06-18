class Flashcard < ApplicationRecord
  belongs_to :user

  validates :foreign, presence: true
  validates :maternal, presence: true

  has_many :flashcard_categories
  has_many :categories, through: :flashcard_categories
end
