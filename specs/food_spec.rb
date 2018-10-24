require('minitest/autorun')
require('minitest/rg')
require_relative('../food')

class TestFood < Minitest::Test

  def test_food_has_name
    pizza = Food.new("Pizza", 9, 3)
    assert_equal("Pizza", pizza.name)
  end

  def test_food_has_price
    pizza = Food.new("Pizza", 9, 3)
    assert_equal(9, pizza.price)
  end

  def test_food_has_rejuvenation
    pizza = Food.new("Pizza", 9, 3)
    assert_equal(3, pizza.rejuvenation_level)
  end

end
