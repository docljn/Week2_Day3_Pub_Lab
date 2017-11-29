class Drink

  attr_reader :name, :price, :units

  # all information about a drink should be publicly readable

  def initialize(name, price, units)
    @name = name
    @price = price
    @units = units
  end

end
