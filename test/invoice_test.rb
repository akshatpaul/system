Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }
require "test/unit"

# This is the test Class for Invoice model
# containing unit test cases for the same.

class InvoiceTest < Test::Unit::TestCase
  def setup
    @item1 = Item.new("fruits", "grocery", 100)
    @item2 = Item.new("phone", "electronics", 100)
    @item3 = Item.new("paracetamol", "medicine", 200)
    @user1 = Customer.new("Akshat", true, (Time.now - 3*12*365*24*60*60))
    @user2 = Employee.new("John", Time.now)
    @invoice1 = Invoice.new([@item1, @item2, @item3], @user1)
    @invoice2 = Invoice.new([@item1, @item2, @item3], @user2)
  end


  def test_create_bill_list
    output1 =
        [{"discount_price" => 100, "item_sale_price" => 100, "item_name" => "fruits"},
         {"discount_price" => 90, "item_sale_price" => 100, "item_name" => "phone"},
         {"discount_price" => 180, "item_sale_price" => 200, "item_name" => "paracetamol"}]
    assert_equal(@invoice1.create_bill, output1)

    output = [{"item_sale_price" => 100, "discount_price" => 100, "item_name" => "fruits"},
              {"item_sale_price" => 100, "discount_price" => 70, "item_name" => "phone"},
              {"item_sale_price" => 200, "discount_price" => 140, "item_name" => "paracetamol"}]
    assert_equal(@invoice2.create_bill, output)
  end

  def test_calculate_total_amount_to_paid
    bill = [{"discount_price" => 100, "item_sale_price" => 100, "item_name" => "fruits"},
            {"discount_price" => 90, "item_sale_price" => 100, "item_name" => "phone"},
            {"discount_price" => 180, "item_sale_price" => 200, "item_name" => "paracetamol"}]
    assert_equal(@invoice1.calculate_total_amount_to_paid(bill), 352)
  end
end
