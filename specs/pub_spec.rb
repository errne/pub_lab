require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')
require_relative('../customer')
require_relative('../pub')
require_relative('../food')

class PubTest < Minitest::Test

  def setup
    @beer = Drink.new("Beer", 5, 4)
    @whiskey = Drink.new("Whiskey", 6, 8)
    @wine = Drink.new("Wine", 4, 6)
    @stock = {@beer => 5, @whiskey => 3, @wine => 6}
    @stock2 = {@beer => 1, @whiskey => 3, @wine => 6}
    # @drinks = [@beer, @whiskey, @wine]

    @pizza = Food.new("Pizza", 9, 3)

    @joe = Customer.new("Joe", 19, 55)
    @jen = Customer.new("Jen", 16, 99)

    # @pub1 = Pub.new("The Red Lion", @drinks)
    @pub1 = Pub.new("The Red Lion", @stock)
    @pub2 = Pub.new("The Orange Lion", @stock2)

  end

  def test_pub_has_name
    assert_equal("The Red Lion", @pub1.name)
  end

  def test_pub_has_menu
    # assert_equal([@beer, @whiskey, @wine], @pub1.drinks)
    assert_equal({@beer => 5, @whiskey => 3, @wine => 6}, @pub1.drinks)
  end

  def test_chech_item_stock_level
    assert_equal(5, @pub1.check_stock(@beer))
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
    assert_equal(4, @pub1.check_stock(@beer))
  end

  def test_pub_can_sell_item__food
    @pub1.sell_item(@joe, @pizza)
    assert_equal(19, @pub1.check_till())
    assert_equal(46, @joe.check_wallet())
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

  def test_pub_can_sell_item__too_drunk_buys_pizza
    @pub1.sell_item(@joe, @whiskey)
    @pub1.sell_item(@joe, @whiskey)
    @pub1.sell_item(@joe, @whiskey)
    @pub1.sell_item(@joe, @whiskey)
    @pub1.sell_item(@joe, @pizza)
    assert_equal(37, @pub1.check_till())
    assert_equal(28, @joe.check_wallet())
  end

  def test_sell_item__when_not_in_stock
    @pub2.sell_item(@joe, @beer)
    @pub2.sell_item(@joe, @beer)
    assert_equal(15, @pub2.check_till())
    assert_equal(50, @joe.check_wallet())
  end

  def test_pub_stock_value
    assert_equal(67, @pub1.evaluate_stock())
  end


end
