require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')
require_relative('../food.rb')

class PubTest < MiniTest::Test

  def setup()
    @customer1 = Customer.new("Zack", 100, 22, 2)
    @customer2 = Customer.new("Spencer", 50, 25, 5)
    @customer3 = Customer.new("Lilith", 60, 24, 0)
    @customer4 = Customer.new("Matt", 20, 17, 0)

    @drink1 = Drink.new("Beer", 5, 1)
    @drink2 = Drink.new("Wine", 15, 2)
    @drink3 = Drink.new("Coke", 2, 0)
    @food1 = Food.new("Spag bol", 10, 5)
    @food2 = Food.new("Walkers", 2, 1)
    @food3 = Food.new("Sandwich", 4, 2)
    @pub = Pub.new("The Hefty Sailor", 5000, {
      @drink1.price => 50,
      @drink2.price => 10,
      @drink3.price => 20
    })
  end

  def test_customer_wallet
    assert_equal(80, @customer1.reduce_money_wallet(20))
  end

  def test_pub_till
    assert_equal(5100, @pub.increase_money_till(100))
  end

  def test_buy_drink
    @customer1.buy_drink( @drink1)
    assert_equal(95, @customer1.wallet)
    assert_equal(3, @customer1.drunk_lvl)
  end

  def test_age_check
    assert_equal("Old enough", @pub.age_check(@customer2))
  end

  def test_serve_customer
    @pub.serve_customer(@customer1, @drink2)
    assert_equal(5015, @pub.till)
    assert_equal(85, @customer1.wallet)
  end

  def test_consume_drink
    @customer3.consume_drink(@drink2)
    assert_equal(2, @customer3.drunk_lvl)
  end

  def test_check_drunk
    assert_equal("Too drunk", @pub.check_drunk(@customer2))
    assert_equal("Sober!", @pub.check_drunk(@customer3))
  end

  def test_consume_food
    assert_equal(0, @customer2.consume_food(@food1))
  end

  def test_buy_food
    @customer1.buy_food(@food3, @pub)
    assert_equal(96, @customer1.wallet)
    assert_equal(5004, @pub.till)
    assert_equal(0, @customer1.drunk_lvl)
  end

  def test_total_stock_value
    assert_equal(440, @pub.total_stock_value)
  end


end #class end
