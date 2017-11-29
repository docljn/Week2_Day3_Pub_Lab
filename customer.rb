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
  # REFACTORING buy_drink:

  # needs sell(drink) in pub

  def pay_for(drink)
    @wallet -= drink.price
  end



  def buy_drink(pub, drink_name)
    # check if pub will serve customer &&
    # check if customer can afford drink
    drink = pub.select_drink(drink_name)
    if can_afford?(drink) && pub.will_serve?(self)
      pay_for(drink)
      #step 2. pub till increases by drink sold value.
      # refactor: pub sells drink?
      pub.add_money(drink.price)
      #step 3. customer gets more drunk.
      @intoxication += drink.units #consider separate method?

      # consider changing this to take the name, and pub works out the price etc within a 'sell drink' method?
    else
      return "Transaction declined"
    end
  end


end
