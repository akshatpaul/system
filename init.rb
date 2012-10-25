# Name : Mckinsey Billing Problem
# Purpose : This module shows the demo of the BillingSystem Problem,
#           satisfying the conditions described in problem statement.
# Original Author : Akshat Paul
# Instructions : Launch this Ruby file from the command line to begin.
#



Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

# Demo data for Items
@item1 = Item.new("Wheat Flour", "grocery", 200)
@item2 = Item.new("Cups", "utensils", 100)
@item3 = Item.new("ball", "equipment", 200)

# Demo date for customer with store
@customer1 = Customer.new("Steve Jobs", true, (Time.now - 3*12*365*24*60*60))
@invoice1 = Invoice.new([@item1, @item2, @item3], @customer1)
@invoice1.print_bill

# Demo data for employee with store
@customer2 = Employee.new("Akshat Paul", Time.now)
@invoice2 = Invoice.new([@item1, @item2, @item3], @customer2)
@invoice2.print_bill
