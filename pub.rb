class Pub

  attr_reader :name, :till, :drinks

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def add_money(amount)
    @till += amount
  end

  def select_item(drink_name)
    # should probably change drinks to stock,
    # but here is where I need to know how to
    # make a change to the pub structure
    # not affect any of the other classes....
    for drink in @drinks
      return drink if drink.name == drink_name.capitalize
    end
    return nil
  end


  def will_serve?(customer)
    # Pub checks customer age before serving
    customer.age >= 18  && customer.intoxication < 15
  end

  def sell(drink)
    if @drinks.include? drink
      @till += drink.price
    end
  end


end
