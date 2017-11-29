class Drink

  attr_reader :name, :price, :units

  # all information about a drink should be accessible to the
  # pub.
  # can see no reason to hide it from customers, either.

  def initialize(name, price, units)
    @name = name
    @price = price
    @units = units
  end

end
