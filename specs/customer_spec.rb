require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")
require_relative("../drink")
require_relative("../pub")

class TestCustomer < MiniTest::Test

  def test_customer_has_name
    customer = Customer.new("Olga", 30, 21)
    assert_equal("Olga", customer.name)
  end

  def test_customer_has_money
    customer = Customer.new("Olga", 30, 21)
    assert_equal(30, customer.wallet)
  end


  def test_customer_can_afford_drink_true
    gin = Drink.new("Gin", 6, 2)
    vodka = Drink.new("Vodka", 4, 2)
    customer = Customer.new("Olga", 100, 21)
    # need a pub after refactoring find drink
    # as now the pub finds a drink by name
    pub = Pub.new("Chanter", 1000, [gin, vodka])


    expected = true
    actual = customer.can_afford?(gin.price)
    assert_equal(expected, actual)

  end

  def test_customer_can_afford_drink_false
    gin = Drink.new("Gin", 6, 2)
    customer = Customer.new("Olga", 4, 21)
    # need a pub after refactoring find drink
    # as now the pub finds a drink by name
    pub = Pub.new("Chanter", 1000, [gin])

    expected = false
    actual = customer.can_afford?(gin.price)
    assert_equal(expected, actual)
  end


  def test_customer_can_buy_drink__under18_refused
    gin = Drink.new("Gin", 6, 2)
    pub = Pub.new("Chanter", 1000, [gin])
    lorna = Customer.new("Lorna", 100, 12)

    lorna.buy_drink(pub, "gin")
    expected = 100
    actual = lorna.wallet
    assert_equal(expected, actual)
  end

  def test_customer_can_buy_drink__over18_insufficient_funds
    gin = Drink.new("Gin", 6, 2)
    chanter = Pub.new("Chanter", 1000, [gin])
    lorna = Customer.new("Lorna", 4, 21)

    lorna.buy_drink(chanter, "gin")
    expected = 4
    actual = lorna.wallet
    assert_equal(expected, actual)
  end


  def test_customer_intoxication_level_increases
    drink = Drink.new("Gin", 6, 2)
    pub = Pub.new("Chanter", 1000, [drink])
    olga = Customer.new("Olga", 50, 21)

    olga.buy_drink(pub, "gin")
    expected = 2
    actual = olga.intoxication
    assert_equal(expected, actual)

  end

  # REFACTORING buy_drink: need pay_for(drink)

  # def test_customer_pay_for_drink
  #   drink = Drink.new("Gin", 6, 2)
  #   lorna = Customer.new("Lorna", 100, 12)
  #   # pub = Pub.new("Chanter", 1000, [drink])
  #
  #   lorna.pay_for("gin")
  #
  #   assert_equal(94, lorna.wallet)
  #
  # end



end
