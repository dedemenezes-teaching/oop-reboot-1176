require_relative './app/models/restaurant.rb'
require_relative './app/models/review.rb'

restaurant_one = Restaurant.new(name: 'Temakeria', price: '20', id: 1)
review_one = Review.new(id: 1, content: 'Very good', rating: 4, restaurant: restaurant_one)

p review_one
