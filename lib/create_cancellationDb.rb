require 'rubygems'
require 'faster_csv'

unless File.exists?("../UoMAirlinesCancellationsDB.csv")
  FasterCSV.open("../UoMAirlinesCancellationsDB.csv", "w") do |csv|
    csv << ["ticket_number","us_Email","payment"]
  end
end

FasterCSV.foreach("../UoMAirlinesCancellationsDB.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|
   puts row[0]
end
