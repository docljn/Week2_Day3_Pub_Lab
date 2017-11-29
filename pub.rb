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

  def select_drink(drink_name)
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
