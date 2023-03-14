class Review
  def initialize(attributes = {})
    @id = attributes[:id]
    @content = attributes[:content]
    @rating = attributes[:rating]
    @restaurant = attributes[:restaurant]
  end
end
