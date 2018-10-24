class Customer
  attr_reader :name, :drunkeness

  def initialize(name, age, wallet)
    @name = name
    @age = age
    @wallet = wallet
    @drunkeness = 0
  end

  def show_id()
    return @age
  end

  def check_wallet()
    return @wallet
  end

  def drink_drink(drink)
    @drunkeness += drink.alcohol_level
  end

  def buy_item(item)
    @wallet -= item.price
    return item.price
  end

end
