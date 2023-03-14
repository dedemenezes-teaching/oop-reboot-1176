# TODO: code a class `Router` that shows the user the menu of options and asks the user to choose an option.
class Router
  def initialize(restaurants_controller)
    @restaurants_controller = restaurants_controller
    @running = false
  end

  def run
    @running = true
    while @running
      display_options
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  def route_action(action)
    case action
    when 1 then @restaurants_controller.list
    when 9 then stop!
    else
      puts "Please press 1, 2, 3, 4 or 9"
    end
  end

  def stop!
    @running = false
  end

  def display_options
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all restaurants"
    puts "9 - Stop and exit the program"
  end
end
