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

  def add_money_to_till(item)
    @till += item.price
  end

  def check_age(customer)
    return customer.show_id() >= 18
  end

  def check_drunkeness(customer)
    return customer.drunkeness < 20
  end
  
end
