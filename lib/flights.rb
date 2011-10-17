require 'rubygems'
require 'faster_csv'

unless File.exists?("../UoMAirlinesFlightsDB.csv")
  FasterCSV.open("../UoMAirlinesFlightsDB.csv", "w") do |csv|
    csv << ["fl_Id","fl_Departure","fl_Destination","fl_DepartureTime","fl_ArrivalTime","fl_Price"]
  end
end

FasterCSV.open("../UoMAirlinesFlightsDB.csv", "a") do |csv|
  csv << ["1","Manchester","Dubai","12:00","18:00","350"]
end

FasterCSV.foreach("../UoMAirlinesFlightsDB.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|
   puts row[0]
end
