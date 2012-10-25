Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }
require "test/unit"

# This is the test Class for item model
# containing unit test cases for the same.

class ItemTest < Test::Unit::TestCase
  def setup
    @item = Item.new("apple", "grocery", 100)
  end

  def test_creation
    assert_equal(@item.name, "apple")
  end

  def test_item_is_grocery
    assert_equal(@item.is_item_grocery, true)
    @item_not_groccery = Item.new("phone", "electronics", 230)
    assert_equal(@item_not_groccery.is_item_grocery, false)
  end

  def test_calculate_discount
    @user1 = Customer.new("Akshat", true, (Time.now - 3*12*365*24*60*60))
    @user2 = Employee.new("Akshat", Time.now)
    @user3 = Customer.new("Akshat", false, Time.now)
    assert_equal(@item.calculate_discount(@user1), 100)
    assert_equal(@item.calculate_discount(@user2), 100)
    assert_equal(@item.calculate_discount(@user3), 100)

    @item_electronics = Item.new("phone", "electronics", 100)
    assert_equal(@item_electronics .calculate_discount(@user1), 90)
    assert_equal(@item_electronics .calculate_discount(@user2), 70)
    assert_equal(@item_electronics .calculate_discount(@user3), 100)
  end
end
