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

  def can_afford?(price)
    # Check if customer's wallet is greater than or equal
    # to the price
    @wallet >= price
  end

  # def pay_for(drink_name)
  # end




  def buy_drink(pub, drink_name)
    # check if pub will serve customer &&
    # check if customer can afford drink
    drink = pub.select_drink(drink_name)
    if can_afford?(drink.price) && pub.will_serve?(self)
      # step 1. customer wallet reduces by price of drink.
      @wallet -= drink.price #consider separate method?
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
