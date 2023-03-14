# TODO: Glue together all the files so this file will start your app
require_relative 'app/repositories/restaurant_respository'
require_relative 'app/controllers/restaurants_controller'
require_relative 'router'

restaurant_repo = RestaurantRepository.new("./data/restaurants.csv")
restaurants_controller = RestaurantsController.new(restaurant_repo)

router = Router.new(restaurants_controller)
router.run
