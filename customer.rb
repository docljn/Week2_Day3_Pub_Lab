class Customer

  attr_reader :name, :wallet, :age, :intoxication
  # CARE: consider whether name and wallet should be readable by other classes? Maybe should need to be told?
  # UNCLEAR

  def initialize(name, wallet, age, intoxication=0)
    @name = name
    @wallet = wallet
    @age = age
    @intoxication = intoxication
  end

  def can_afford?(drink)
    @wallet >= drink.price
  end

  def pay_for(drink)
    @wallet -= drink.price
  end

  def consume(drink)
    @intoxication += drink.units
  end


  def buy_drink(pub, drink_name)
    drink = pub.select_drink(drink_name)
    if can_afford?(drink) && pub.will_serve?(self)
      pay_for(drink)
      pub.sell(drink)
      consume(drink)
    else
      return "Transaction declined"
    end
  end


end
