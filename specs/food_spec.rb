require("minitest/autorun")
require("minitest/rg")
require_relative("../food")

class TestFood < MiniTest::Test

  def setup
    @chips = Food.new("Chips", 5, 3)
    @kebab = Food.new("Kebab", 8, 5)
    @pakora = Food.new("Pakora", 7, 4)
  end

  def test_food_has_name
    assert_equal("Chips", @chips.name)
  end

  def test_food_has_price
    assert_equal(8, @kebab.price)
  end

  def test_food_has_rejuvenation
    assert_equal(4, @pakora.rejuvenation)
  end


end
