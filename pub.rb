class Pub

  attr_reader :name, :till, :drinks

  def initialize(name, till, drinks = {})
    @name = name
    @till = till
    @drinks = drinks
  end


  def increase_money_till(amount)
    @till += amount
  end

  def age_check(customer)
    if customer.age >= 18
      return "Old enough"
    else
      return "Under age"
    end
  end

  def serve_customer(customer, drink)
    if age_check(customer) == "Old enough"
      if check_drunk(customer) == "Sober!"
        customer.buy_drink(drink)
        increase_money_till(drink.price)
      end
    end
  end

  def check_drunk(customer)
    if customer.drunk_lvl >= 5
      return "Too drunk"
    else
      return "Sober!"
    end
  end

  def total_stock_value
    total = 0
    for drink in @drinks
      total += drink[0] * drink[1]
    end
    return total
  end
end #class end
