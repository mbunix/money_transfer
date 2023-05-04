# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
  require 'securerandom'
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

confirmed_at = Time.now.utc
# Create a user with some transactions
user = User.create!(
  name: "John Doe",
  email: "spectre@gmail.com",
  password: "password",
 
)
loop do
    confirmation_token = SecureRandom.base58(24)
    break unless User.exists?(confirmation_token: confirmation_token)
  end
  

# Add some transactions for the user
user.transactions.create!(
  amount: 1000,
  
)

user.transactions.create!(
  amount: 500,
  
)

user.transactions.create!(
  amount: 200,
  
)

# Set the user's balance based on their transactions
user.update!(balance: user.transactions.sum(:amount))

