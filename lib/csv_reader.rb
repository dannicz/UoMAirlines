require 'rubygems'
require 'faster_csv'
require '../lib/user'

class CSVReader

  def all_customers
    customers = []
    customer = nil

    FasterCSV.foreach("../UoMAirlinesUsersDB.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|

      if row[5] != 'admin'
        customer = User.new row[0], row[1], row[2], row[3], row[4], "client"
        customers.push customer
      end
    end

    customers

end

def all_admins

  admins = []
  admin = nil

  FasterCSV.foreach("../UoMAirlinesUsersDB.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|

    if row[5] == 'admin'
      admin = User.new row[0], row[1], row[2], row[3], row[4],"admin"
      admins.push admin
    end
  end

  admins
end

=begin
def all_flights

  flights = []
  flight = nil

  FasterCSV.foreach("../UoMAirlinesFlightsDB.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|

    put row
    flight = new Flight
    flights.push flight

 end

end
=end

end