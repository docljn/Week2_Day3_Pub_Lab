require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")
require_relative("../drink")
require_relative("../customer")


class TestPub < MiniTest::Test

  # A Pub should have a name, a till, and a collection of drinks
  def test_pub_has_name
    cloisters = Pub.new("Cloisters", 250, [])
    expected = "Cloisters"
    result = cloisters.name
    assert_equal(expected, result)
  end

  def test_pub_has_money_in_till
    cloisters = Pub.new("Cloisters", 250, [])
    expected = 250
    result = cloisters.till
    assert_equal(expected, result)
  end

  def test_pub_has_drinks
    tennants = Drink.new("Tennants", 5)
    gin = Drink.new("Gin", 7)
    drinks = [tennants, gin]
    cloisters = Pub.new("Cloisters", 250, drinks)
    expected = drinks
    result = cloisters.drinks
    assert_equal(expected, result)
  end

  def test_add_money_to_till
    tennants = Drink.new("Tennants", 5)
    gin = Drink.new("Gin", 7)
    drinks = [tennants, gin]
    ccs = Pub.new("ccs", 1000, drinks)
    expected = 1010
    result = ccs.add_money(10)
  end


  def test_pub_will_serve_customer__over18
    ccs = Pub.new("ccs", 1000, [])
    kris = Customer.new("Kris", 50, 42)
    # we don't need any drinks as we're not buying!
    expected = true
    actual = ccs.will_serve?(kris)
    assert_equal(expected, actual)
  end

  def test_pub_will_serve_customer__under18
    ccs = Pub.new("ccs", 1000, [])
    jennifer = Customer.new("Jennifer", 50, 16)
    # we don't need any drinks as we're not buying!
    expected = false
    actual = ccs.will_serve?(jennifer)
    assert_equal(expected, actual)
  end

end
