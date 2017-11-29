require("minitest/autorun")
require("minitest/rg")
require_relative("../customer")
require_relative("../drink")
require_relative("../food")
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
    chanter = Pub.new("Chanter", 1000, [gin, vodka])


    expected = true
    actual = customer.can_afford?(gin)
    assert_equal(expected, actual)

  end

  def test_customer_can_afford_drink_false
    gin = Drink.new("Gin", 6, 2)
    customer = Customer.new("Olga", 4, 21)
    # need a pub after refactoring find drink
    # as now the pub finds a drink by name
    chanter = Pub.new("Chanter", 1000, [gin])

    expected = false
    actual = customer.can_afford?(gin)
    assert_equal(expected, actual)
  end

  def test_customer_pay_for_drink
    drink = Drink.new("Gin", 6, 2)
    lorna = Customer.new("Lorna", 100, 32)

    lorna.pay_for(drink)
    assert_equal(94, lorna.wallet)

  end

  def test_customer_consumes_drink
    drink = Drink.new("Wine", 8, 3)
    lorna = Customer.new("Lorna", 100, 32)

    lorna.consume(drink)
    assert_equal(3, lorna.intoxication)

  end

  def test_customer_intoxication_level_increases
    drink = Drink.new("Gin", 6, 2)
    pub = Pub.new("Chanter", 1000, [drink])
    olga = Customer.new("Olga", 50, 21)

    olga.buy_item(pub, "gin")
    expected = 2
    actual = olga.intoxication
    assert_equal(expected, actual)

  end

  def test_customer_intoxication_level_decreases
    drink = Drink.new("Gin", 6, 2)
    food = Food.new("Kebab", 8, 5)
    pub = Pub.new("Chanter", 1000, [drink, food])
    olga = Customer.new("Olga", 50, 21, 10)

    olga.buy_item(pub, "kebab")
    expected = 5
    actual = olga.intoxication
    assert_equal(expected, actual)

  end


  def test_customer_can_buy_drink__under18_refused
    gin = Drink.new("Gin", 6, 2)
    chanter = Pub.new("Chanter", 1000, [gin])
    lorna = Customer.new("Lorna", 100, 12)

    lorna.buy_item(chanter, "gin")
    assert_equal(100, lorna.wallet)
    assert_equal(0, lorna.intoxication)
    assert_equal(1000, chanter.till)
  end

  def test_customer_can_buy_drink__over18__insufficient_funds
    gin = Drink.new("Gin", 6, 2)
    chanter = Pub.new("Chanter", 1000, [gin])
    lorna = Customer.new("Lorna", 4, 21)

    lorna.buy_item(chanter, "gin")
    assert_equal(4, lorna.wallet)
    assert_equal(0, lorna.intoxication)
    assert_equal(1000, chanter.till)
  end

  def test_customer_can_buy_drink__over18__sufficient_funds__drink_not_in_stock
    gin = Drink.new("Gin", 6, 2)
    wine = Drink.new("Wine", 8, 4)
    # need to instantiate wine otherwise fails due to
    # unknown method/variable
    chanter = Pub.new("Chanter", 1000, [gin])
    lorna = Customer.new("Lorna", 40, 21)

    lorna.buy_item(chanter, "wine")
    assert_equal(40, lorna.wallet)
    assert_equal(0, lorna.intoxication)
    assert_equal(1000, chanter.till)
  end




  def test_customer_can_buy_drink__over18__sufficient_funds__drink_in_stock__too_drunk
    gin = Drink.new("Gin", 6, 2)
    wine = Drink.new("Wine", 8, 4)
    # need to instantiate wine otherwise fails due to
    # unknown method/variable
    chanter = Pub.new("Chanter", 1000, [gin, wine])
    lorna = Customer.new("Lorna", 40, 21, 20)

    lorna.buy_item(chanter, "wine")
    expected = 40
    actual = lorna.wallet
    assert_equal(expected, actual)
  end






end
