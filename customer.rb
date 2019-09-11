class Customer

  attr_reader :name, :wallet, :age, :drunk_lvl

  def initialize(name, wallet, age, drunk_lvl)
    @name = name
    @wallet = wallet
    @age = age
    @drunk_lvl = drunk_lvl
  end

  def reduce_money_wallet(amount)
    @wallet -= amount
  end

  def buy_drink(drink)
    reduce_money_wallet(drink.price)
    consume_drink(drink)
  end

  def consume_drink(drink)
    @drunk_lvl += drink.units
  end

  def buy_food(food, pub)
    reduce_money_wallet(food.price)
    pub.increase_money_till(food.price)
    consume_food(food)
  end

  def consume_food(food)
    @drunk_lvl -= food.rejuvenation
  end


end #class end
