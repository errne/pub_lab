require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < Minitest::Test

  def test_drink_has_name
    drink1 = Drink.new("Beer", 5, 4)
    assert_equal("Beer", drink1.name)
  end

  def test_drink_has_price_and_alcohol_level
    drink1 = Drink.new("Beer", 5, 4)
    assert_equal(5, drink1.price)
    assert_equal(4, drink1.alcohol_level)
  end

end
