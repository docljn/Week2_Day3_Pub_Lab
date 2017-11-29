class Pub

  attr_reader :name, :till, :stock

  def initialize(name, till, stock)
    @name = name
    @till = till
    @stock = stock
  end

  def add_money(amount)
    @till += amount
  end

  def select_item(item_name)
    # should probably change drinks to stock,
    # but here is where I need to know how to
    # make a change to the pub structure
    # not affect any of the other classes....
    for item in @stock
      return item if item.name == item_name.capitalize
    end
    return nil
  end


  def will_serve?(customer)
    # Pub checks customer age before serving
    customer.age >= 18  && customer.intoxication < 15
  end

  def sell(item)
    if @stock.include? item
      @till += item.price
    end
  end


end
