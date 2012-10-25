# Item class is responsible for initializing item name, type and price.

class Item
  attr_accessor :name, :type, :price

  def initialize(name, type, price)
    @name, @type, @price = name, type, price
  end

  def is_item_grocery
    @type == "grocery"
  end

  # business logic for discount on every product type
  def calculate_discount user
    if !is_item_grocery
      user.discounted_amount(@price)
    else
      @price
    end
  end
end
