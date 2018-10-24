require('minitest/autorun')
require('minitest/rg')
require_relative('../food')

class TestFood < Minitest::Test

  def test_food_has_name
    pizza = Food.new("Pizza")
    assert_equal("Pizza", pizza.name)

  end

end
