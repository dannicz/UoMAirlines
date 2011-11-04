require "rspec"
 require 'faster_csv'
require '../lib/user'
require "../lib/csv_reader"
require "../lib/user_writer"

describe CSVReader do

  before do
    user_writer = UserWriter.new
	  user_writer.create_users_db_unless_exists
  end

  it "should get all the customers from the CSV" do
    customers = subject.all_customers
    customers.size.should >= 0
  end


  it "should get all the admin users from the CSV" do
    adminUsers = subject.all_admins
    adminUsers.size.should >= 0
  end

  it "should get all the flights from the CSV" do
    flights = subject.all_flights
    flights.size.should >= 0
  end

end


