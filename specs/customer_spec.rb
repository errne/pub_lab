require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../drink')

class CustomerTest < Minitest::Test

  def setup
    @drink1 = Drink.new("Wine", 4, 6)
    @customer1  = Customer.new("Joe", 19, 55)
  end

  def test_customer_has_name
    assert_equal("Joe", @customer1.name)
  end

  def test_customer_can_show_id
    assert_equal(19, @customer1.show_id)
  end

  def test_can_check_wallet
      assert_equal(55, @customer1.check_wallet())
  end

  def test_customer_has_drunkeness_level
      assert_equal(0, @customer1.drunkeness)
  end

  def test_customer_can_get_drunk
    @customer1.drink_drink(@drink1)
    assert_equal(6, @customer1.drunkeness)
  end

  def test_customer_can_buy_item
    @customer1.buy_item(@drink1)
    assert_equal(51, @customer1.check_wallet())
  end


end
