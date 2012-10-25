require File.dirname(__FILE__) + '/../lib/customer.rb'
require "test/unit"

# This is the test Class for customer model
# containing unit test cases for the same.

class CustomerTest < Test::Unit::TestCase
  def setup
    @customer = Customer.new("Akshat", true, (Time.now - 3*12*365*24*60*60))
  end

  def test_creation
    assert_equal(@customer.name, "Akshat")
    assert_equal(@customer.affiliation_flag, true)
  end

  def test_applicable_for_loyalty_discount
    assert_equal(@customer.applicable_for_loyalty_discount, true)
    @customer_new = Customer.new("Akshat", true, Time.now)
    assert_equal(@customer_new.applicable_for_loyalty_discount, false)
  end

  def test_for_affilate_discount
    assert_equal(@customer.affiliation_discount(100), 90)
    @customer_with_no_affilation = Customer.new("Akshat", false)
    assert_equal(@customer_with_no_affilation.affiliation_discount(100), 100)
  end

  def test_for_loyalty_discount
    assert_equal(@customer.loyalty_discount(100), 95)
    @customer_with_no_loyalty= Customer.new("Akshat", false, Time.now)
    assert_equal(@customer_with_no_loyalty.loyalty_discount(100), 100)
  end

  def test_for_discount_amount
    assert_equal(@customer.discounted_amount(100), 90)
  end


end

