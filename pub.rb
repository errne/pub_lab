class Pub

  attr_reader :name, :drinks

  def initialize(name, drinks)
    @name = name
    @drinks = drinks
    @till = 10
  end

  def check_till()
    return @till
  end

  def add_money_to_till(cash)
    @till += cash
  end

  def check_stock(item)
    return drinks[item]
  end

  def check_age(customer)
    return customer.show_id() >= 18
  end

  def sober_enough?(customer)
    return customer.drunkeness < 20
  end

  def reduce_stock(item)
    drinks[item] -= 1
  end

  def sell_item(customer, item)
    if item.class == Drink
      return "You are too young" unless check_age(customer)
      return "You re too drunk" unless sober_enough?(customer)
      return "We do not have that anymore" unless check_stock(item) > 0
      reduce_stock(item)
    end
    cash = customer.buy_item(item)
    add_money_to_till(cash)
  end

  def evaluate_stock()
    total_value = 0
    drinks.each{|drink, amount|
      total_value += (amount*drink.price)
    }
    return total_value
  end

end
