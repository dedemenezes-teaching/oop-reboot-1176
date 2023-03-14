require_relative '../views/restaurants_view'

class RestaurantsController

  def initialize(restaurant_repository)
    @restaurant_repository = restaurant_repository
    @restaurants_view = RestaurantsView.new
  end

  def list
    restuarants_array = @restaurant_repository.all
    @restaurants_view.display_list(restuarants_array)
  end
end
