require "rspec"
 require 'faster_csv'
require '../lib/user'
require "../lib/csv_reader"


describe "CSV Reader" do
  it "should get all the customers from the CSV" do
    csv_reader = CSVReader.new()
    customers = csv_reader.all_customers
    customers.size.should >= 0
  end


  it "should get all the admin users from the CSV" do
    csv_reader = CSVReader.new()
    adminUsers = csv_reader.all_admins
    adminUsers.size.should >= 0
  end

  it "should get all the flights from the CSV" do
    csv_reader = CSVReader.new()
    flights = csv_reader.all_flights
    flights.size.should >= 0
  end

end



