# TODO: code a class `Router` that shows the user the menu of options and asks the user to choose an option.
# call the RIGHT controller to execute the action

class Router
  # STATE
  # controllers instances
  def initialize(restaurants_controller)
    @restaurants_controller = restaurants_controller
  end

  # behavior
  # run
  def run
    @running = true
    while @running
      display_options
      # 2. get the user choice
      user_choice = gets.chomp.to_i
      route_to_action(user_choice)
    end
  end

  def display_options
    # 1. display the menu options
    puts "1. List all restaurants"
    puts "2. Add a restaurants"
    puts "3. List all reviews"
    puts "4. Add a reviews"
    puts "9. Quit"
  end

  def route_to_action(user_choice)
    # 3. call the right controller action
    case user_choice
    when 1
      @restaurants_controller.list
    when 2
      puts 'TODO: ADD RESTAURANT'
    when 9
      @running = false
    else
      puts 'Choose a valid option'
    end
  end
end
