require 'rubygems'
require 'faster_csv'
require '../lib/user'
require '../lib/flight'
require '../lib/ticket'

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

begin
def all_flights

  flights = []
  flight = nil

  FasterCSV.foreach("../UoMAirlinesFlightsDB.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|

    flight = Flight.new row[0], row[1], row[2], row[3], row[4], row[5]
    flights.push flight

 end

  return flights

end
end



def all_users
    customers = []
    customer = nil

    FasterCSV.foreach("../UoMAirlinesUsersDB.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|

        customer = User.new row[0], row[1], row[2], row[3], row[4], row[5]
        customers.push customer
      end


    customers
end



def all_tickets

  flights = []
  flight = nil

  FasterCSV.foreach("../UoMAirlinesPaymentsDB.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|

    flight = Ticket.new row[0], row[1], row[2], row[3], row[4], row[5]
    flights.push flight

 end
  return flights

end


end