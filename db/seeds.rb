# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying all records..."
FlashcardCategory.destroy_all
Flashcard.destroy_all
Category.destroy_all
User.destroy_all

puts "Seeding database with user, category, flashcard, and flashcard_category"
puts "Creating user..."
user = User.create(name: "John", email: "john@email.com", password: "password")
puts "Creating category..."
category = Category.create(name: "Greetings")
puts "Creating flashcard..."
flashcard = Flashcard.create(foreign: "Bonjour", maternal: "Hello", user: user)
puts "Creating flashcard_category..."
FlashcardCategory.create(flashcard:flashcard, category:category)

puts "Seeded database with user, category, flashcard, and flashcard_category"
