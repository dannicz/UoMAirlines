require "rspec"
require "../lib/csv_reader"
require "../lib/user_writer"

describe UserWriter do

    before do
      subject.create_users_db_unless_exists
    end

    it "should add an user to the CSV file" do

      csv_reader = CSVReader.new()
      customers = csv_reader.all_customers
      customers_old_size= customers.size

      user = User.new "daniel","cuevas","12345678","daniel@manchester","Straford","client"
      subject.append_user user

      customers = csv_reader.all_customers
      customers_new_size=customers.size

      customers_new_size.should == customers_old_size + 1

    end

end