 # billing class is responsible for calculating and printing customer/employee bills.

class Invoice
  attr_accessor :list_of_item, :user, :total_amount
  MASS_DISCOUNT_LEVEL = 100
  MASS_DISCOUNT = 5

  def initialize(list_of_item, user)
    @list_of_item = list_of_item
    @user = user
  end

  def print_bill
    puts "\n\n<<< Welcome To Mckinsey Billing System >>>\n\n"
    puts "Hello " + @user.name + "\n\n"
    bill = create_bill
    bill.each do |type|
      puts type['item_name'].ljust(30) + "    MRP: " + type['item_sale_price'].to_s.ljust(20) + "  After discount:" +type['discount_price'].to_s.rjust(3)
    end
    puts
    puts "="*25 + "\n" + "Total Payable Amount:" +calculate_total_amount_to_paid(bill).to_s + "\n" + "="*25
  end

  def create_bill
    bill = []
    @list_of_item.each do |item|
      row = Hash.new
      row['item_name'] = item.name
      row['item_sale_price'] = item.price
      row['discount_price'] = item.calculate_discount(@user)
      bill << row
    end
    bill
  end

  # calculating total amount after discount
  def calculate_total_amount_to_paid bill
    amount = 0
    bill.each do |row|
      amount = amount + row['discount_price']
    end
    mass_discount(amount)
  end

  # business logic for discount calculated on amount over 100.
  def mass_discount amount
    if amount > MASS_DISCOUNT_LEVEL
      amount - amount* MASS_DISCOUNT/100
    else
      amount
    end
  end

end
