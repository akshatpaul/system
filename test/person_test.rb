require File.dirname(__FILE__) + '/../lib/person.rb'
require "test/unit"

# This is the test Class for person model
# containing unit test cases for the same.

class PersonTest < Test::Unit::TestCase
  def setup
    @person = Person.new("Alex", Time.now)
  end

  # matching user name with creation
  def test_user_creation
    assert_equal(@person.name, "Alex")
  end

end
