# employee class inherits from user class, for initializing employee name and time of creation.

require File.dirname(__FILE__) + '/person.rb'
class Employee < Person
  EMPLOYEE_DISCOUNT = 30

  def initilize(name, created_at)
    super(name, created_at)
  end

  # business logic for employee discount
  def discounted_amount(amount)
    amount - amount*EMPLOYEE_DISCOUNT/100

  end
end
