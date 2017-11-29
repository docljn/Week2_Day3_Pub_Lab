class Customer

  attr_reader :name, :wallet, :age, :intoxication
  # CARE: consider whether name and wallet should be readable by other classes?

  def initialize(name, wallet, age, intoxication=0)
    @name = name
    @wallet = wallet
    @age = age
    @intoxication = intoxication
  end

  def can_afford?(drink)
    # Check if customer's wallet is greater than or equal
    # to the drink price
    # @wallet >= drink.price
    return true if @wallet >= drink.price
    return false if @wallet < drink.price
  end

  def buy_drink(pub, drink)
    # check if pub will serve customer
    # check if customer can afford drink
    if can_afford?(drink) && pub.will_serve?(self)
      # step 1. customer wallet reduces by price of drink.
      @wallet -= drink.price #consider separate method?
      @intoxication += drink.units #consider separate method?
      #step 2. pub till increases by drink sold value.
      pub.add_money(drink.price)
    else
      return "Transaction declined"
    end
  end


end
