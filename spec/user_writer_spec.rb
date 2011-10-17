require "rspec"
require "../lib/csv_reader"
require "../lib/user_writer"

describe "User writer" do
begin
it "should append an user to the CSV" do

    csv_reader = CSVReader.new()
    customers = csv_reader.all_customers
  customers_size= customers.size

  user_writer = UserWriter.new()
  user = User.new "daniel","cuevas","12345678","daniel@manchester","Straford","client"
  user_writer = user_writer.append_user user

  customers = csv_reader.all_customers
   customers.size.should == customers_size + 1

end
end

end