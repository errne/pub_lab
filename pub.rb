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

  def check_age(customer)
    return customer.show_id() >= 18
  end

  def sober_enough?(customer)
    return customer.drunkeness < 20
  end

  def sell_item(customer, item)
    return "You are too young" unless check_age(customer)
    return "You re too drunk" unless sober_enough?(customer)
    cash = customer.buy_item(item)
    add_money_to_till(cash)
  end

end
