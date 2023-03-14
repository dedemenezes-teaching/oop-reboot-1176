class Restaurant
  attr_reader :price #, :name
  # attr_writer :name
  attr_accessor :name
  # STATE / ATTRIBUTES
  # ID
  # NAME
  # PRICE
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end
end
