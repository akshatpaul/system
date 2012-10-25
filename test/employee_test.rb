require File.dirname(__FILE__) + '/../lib/employee.rb'
require "test/unit"

# This is the test Class for employee model
# containing unit test cases for the same.

class EmployeeTest < Test::Unit::TestCase
  def setup
    @employee = Employee.new("Akshat", Time.now)
  end

  def test_creation
    assert_equal(@employee.name, "Akshat")
  end

  def test_for_discount
    assert_equal(@employee.discounted_amount(100), 70)
  end
end
