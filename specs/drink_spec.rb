require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")

class TestDrink < MiniTest::Test

  def test_drink_has_name
    drink = Drink.new("Tennants", 5, 2)
    assert_equal("Tennants", drink.name)
  end

  def test_drink_has_price
    drink = Drink.new("Tennants", 5, 2)
    assert_equal(5, drink.price)
  end

  def test_drink_has_units
    drink = Drink.new("Vodka", 3, 2)
    assert_equal(2, drink.units)
  end

end
