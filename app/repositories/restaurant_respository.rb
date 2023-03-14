require 'csv'
require_relative '../models/restaurant'

class RestaurantRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @restaurants = []
    load_csv
  end

  def all
    @restaurants
  end

  def find(id)
    @restaurants.select do |restaraunt_instance|
      restaraunt_instance.id == id
    end.first
    # but the method select returns AN NEW ARRAY
    # should return ONE INSTANCE OF THE RESTAURANT CLASS
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      #<CSV::Row id:"1" name:"Charlotte I" price:"2">
      # p row
      # 1. CONVERT THE VALUES TO THE RIGHT DATA TYPE
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      # p row
      # MAIN GOAL
      # 2. RECREATE THE RESTAURANT INSTANCE
      restaurant = Restaurant.new(row)

      #3. POPULATE THE RESTAURANTS ARRAY
      @restaurants << restaurant
    end
  end
end
