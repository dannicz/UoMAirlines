require 'rubygems'
require 'faster_csv'

unless File.exists?("../UoMAirlinesFlightsDB.csv")
  FasterCSV.open("../UoMAirlinesFlightsDB.csv", "w") do |csv|
    csv << ["fl_Id","fl_Departure","fl_Destination","fl_DepartureTime","fl_ArrivalTime","fl_Price"]
  end
end

FasterCSV.open("../UoMAirlinesFlightsDB.csv", "a") do |csv|
  csv << ["2","Manchester","New York","12:00","19:00","850"]
end

FasterCSV.foreach("../UoMAirlinesFlightsDB.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |column|
   puts column[0]
end
