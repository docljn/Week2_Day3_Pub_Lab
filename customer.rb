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

  def can_afford?(item)
    @wallet >= item.price
  end

  def pay_for(item)
    @wallet -= item.price
  end

  def consume(item)
    if item.units != nil
      @intoxication += item.units
    end

  end


  def buy_drink(pub, item_name)
    item = pub.select_item(item_name)
    if item != nil && can_afford?(item) && pub.will_serve?(self)
      pay_for(item)
      pub.sell(item)
      consume(item)
    else
      return "Transaction declined"
    end
  end


end
