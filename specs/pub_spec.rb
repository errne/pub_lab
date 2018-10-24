require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')
require_relative('../customer')
require_relative('../pub')

class PubTest < Minitest::Test

  def setup
    @beer = Drink.new("Beer", 5, 4)
    @whiskey = Drink.new("Whiskey", 6, 8)
    @wine = Drink.new("Wine", 4, 6)
    @drinks = [@beer, @whiskey, @wine]

    @joe = Customer.new("Joe", 19, 55)
    @jen = Customer.new("Jen", 16, 99)

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
    @pub1.add_money_to_till(@beer.price)
    assert_equal(15, @pub1.check_till())
  end

  def test_pub_can_check_age
    assert_equal(true, @pub1.check_age(@joe))
  end

  def test_pub_can_check_drunkeness_level__not_too_drunk
    assert_equal(true, @pub1.sober_enough?(@joe))
  end

  def test_pub_can_check_drunkeness_level__too_drunk
    @pub1.sell_item(@joe, @whiskey)
    @pub1.sell_item(@joe, @whiskey)
    @pub1.sell_item(@joe, @whiskey)
    @pub1.sell_item(@joe, @whiskey)
    assert_equal(false, @pub1.sober_enough?(@joe))
  end

  def test_pub_can_sell_item
    @pub1.sell_item(@joe, @beer)
    assert_equal(15, @pub1.check_till())
    assert_equal(50, @joe.check_wallet())
  end

  def test_pub_can_sell_item__underage
    @pub1.sell_item(@jen, @wine)
    assert_equal(10, @pub1.check_till())
    assert_equal("You are too young", @pub1.sell_item(@jen, @wine))
  end


  def test_pub_can_sell_item__not_too_drunk
    @pub1.sell_item(@joe, @whiskey)
    @pub1.sell_item(@joe, @whiskey)
    @pub1.sell_item(@joe, @whiskey)
    assert_equal(28, @pub1.check_till())
  end

  def test_pub_can_sell_item__too_drunk
    @pub1.sell_item(@joe, @whiskey)
    @pub1.sell_item(@joe, @whiskey)
    @pub1.sell_item(@joe, @whiskey)
    @pub1.sell_item(@joe, @whiskey)
    assert_equal(28, @pub1.check_till())

  end


end
