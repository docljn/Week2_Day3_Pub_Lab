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

  def test_customer_can_buy_drink__age_over_18
    drink = Drink.new("Gin", 6, 2)
    pub = Pub.new("Chanter", 1000, [drink])
    customer = Customer.new("Olga", 100, 21)

    customer.buy_drink(pub, drink)
    expected = 94
    actual = customer.wallet
    assert_equal(expected, actual)
    assert_equal(1006,pub.till)
  end

  def test_customer_can_buy_drink_insufficient_funds
    drink = Drink.new("Gin", 6, 2)
    pub = Pub.new("Chanter", 1000, [drink])
    customer = Customer.new("Kris", 2, 21)

    customer.buy_drink(pub, drink)
    expected = 2
    actual = customer.wallet
    assert_equal(expected, actual)
    assert_equal(1000,pub.till)

  end

  def test_customer_can_afford_drink_true
    drink = Drink.new("Gin", 6, 2)
    customer = Customer.new("Olga", 100, 21)

    expected = true
    actual = customer.can_afford?(drink)
    assert_equal(expected, actual)

  end

  def test_customer_can_afford_drink_false
    drink = Drink.new("Gin", 6, 2)
    customer = Customer.new("Olga", 4, 21)

    expected = false
    actual = customer.can_afford?(drink)
    assert_equal(expected, actual)
  end

  def test_customer_can_buy_drink__under18
    drink = Drink.new("Gin", 6, 2)
    pub = Pub.new("Chanter", 1000, [drink])
    lorna = Customer.new("Lorna", 100, 12)

    lorna.buy_drink(pub, drink)
    expected = 100
    actual = lorna.wallet
    assert_equal(expected, actual)
  end

  def test_customer_intoxication_level_increases
    drink = Drink.new("Gin", 6, 2)
    pub = Pub.new("Chanter", 1000, [drink])
    olga = Customer.new("Olga", 50, 21)

    olga.buy_drink(pub, drink)
    expected = 2
    actual = olga.intoxication
    assert_equal(expected, actual)

  end
end
