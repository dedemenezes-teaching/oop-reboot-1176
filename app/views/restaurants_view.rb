class RestaurantsView
  def display_list(restaurants)
    restaurants.each_with_index do |restaurant_instance, index|
      puts "#{index + 1} - #{restaurant_instance.name} - #{restaurant_instance.price}"
    end
  end
end
