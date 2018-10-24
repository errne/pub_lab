require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')
require_relative('../pub')

class PubTest < Minitest::Test

  def setup
    @beer = Drink.new("Beer", 5, 4)
    @whiskey = Drink.new("Whiskey", 6, 8)
    @wine = Drink.new("Wine", 4, 6)
    @drinks = [@beer, @whiskey, @wine]

    @pub1 = Pub.new("The Red Lion", @drinks)
  end

  def test_pub_has_name
    assert_equal("The Red Lion", @pub1.name)
  end

  def test_pub_has_menu
    assert_equal([@beer, @whiskey, @wine], @pub1.drinks)
  end

  def test_can_check_till
    assert_equal(10, @pub1.check_till())
  end

  def test_can_add_money_for_till
    @pub1.add_money_to_till(@beer)
    assert_equal(15, @pub1.check_till())
  end

  

end
