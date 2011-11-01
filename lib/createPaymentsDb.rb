require 'rubygems'
require 'faster_csv'

unless File.exists?("../UoMAirlinesPaymentsDB.csv")
  FasterCSV.open("../UoMAirlinesPaymentsDB.csv", "w") do |csv|
    csv << ["ticket_number,us_Email","fl_Id","fl_Departure","fl_Destination","payment"]
  end
end

FasterCSV.open("../UoMAirlinesPaymentsDB.csv", "a") do |csv|
  csv << ["1,rahul@gmail.com","101","Manchester","Dubai","350"]
end



FasterCSV.foreach("../UoMAirlinesPaymentsDB.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|
   puts row[0]
end