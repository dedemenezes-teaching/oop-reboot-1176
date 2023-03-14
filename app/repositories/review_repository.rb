require 'csv'
require 'pry-byebug'
require_relative '../models/review'

class ReviewRepository
  def initialize(csv_file_path, restaurant_repository)
    @csv_file_path = csv_file_path
    @restaurant_repository = restaurant_repository
    # binding.pry # adds a breakpoint -> stop the exefution of our code right here
    @reviews = []
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @reviews
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      #<CSV::Row id:"1" content:"Amazing place" rating:"5" restaurant_id:"1">
      # 1. convert row data to the right data type
      row[:id] = row[:id].to_i
      row[:rating] = row[:rating].to_i
      # 1.3 FIND THE RIGHT RESTAURANT INSTANCE
      restaurant = @restaurant_repository.find(row[:restaurant_id].to_i)
      # add a new key/value pair to our row hash
      row[:restaurant] = restaurant
      #<CSV::Row id:1 content:"Amazing place" rating:5 restaurant_id:"1" restaurant:#<Restaurant:0x00007f973a7354c8 @id=1, @name="Charlotte I", @price=2>>
      binding.pry
      # 2. Create the instance of review
      review = Review.new(row)
      # 3. populate our reviews array
      @reviews << review
      binding.pry
    end
  end
end
