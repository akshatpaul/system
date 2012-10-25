# Customer class inherits from person class, for initializing customer name, time of creation and affiliation flag.

require File.dirname(__FILE__) + '/person.rb'
class Customer < Person
  attr_accessor :affiliation_flag

  LOYALTY_YEARS = 2
  DISCOUNT_LOYALITY = 5
  DISCOUNT_AFFILATION = 10

  def initialize(name, affiliation_flag, created_at = Time.now)
    super(name, created_at)
    @affiliation_flag = affiliation_flag
  end

  def discounted_amount amount
    if loyalty_discount(amount) < affiliation_discount(amount)
      loyalty_discount(amount)
    else
      affiliation_discount(amount)
    end
  end

  def loyalty_discount amount
    if  applicable_for_loyalty_discount
      (amount - amount*DISCOUNT_LOYALITY/100)
    else
      amount
    end

  end

  def old_in_years
    return (Time.now - self.created_at)/(12*60*60*24*365) if !self.created_at.nil?
    raise "Created time is not there"
  end

  def applicable_for_loyalty_discount
    old_in_years > LOYALTY_YEARS
  end

  # business logic for affilation discount
  def affiliation_discount amount
    if affiliation_flag
      (amount - amount*DISCOUNT_AFFILATION/100)
    else
      amount
    end
  end


end
