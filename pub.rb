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
    drink = nil
    for drink in @drinks
      return drink if drink.name == drink_name.capitalize
    end
  end


  def will_serve?(customer)
    # Pub checks customer age before serving
    customer.age >= 18
  end
end

# A Pub should have a name, a till, and a collection of drinks


# #The method add_money acts on the pub to add
# #the value of the drink to the till
# till_expected = 1006
# actual_till = pub.add_money(drink.price)
# assert_equal(till_expected, actual_till)


# #The method add_money acts on the pub to add
# #the value of the drink to the till
# till_expected = 1006
# actual_till = pub.add_money(drink.price)
# assert_equal(till_expected, actual_till)
