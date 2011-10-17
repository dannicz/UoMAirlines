require 'rubygems'
require 'faster_csv'

unless File.exists?("../UoMAirlinesUsersDB.csv")
  FasterCSV.open("../UoMAirlinesUsersDB.csv", "w") do |csv|
    csv << ["us_FirstName","us_SurName","us_Password","us_Email","us_Address","us_Type"]
  end
end

FasterCSV.open("../UoMAirlinesUsersDB.csv", "a") do |csv|
  csv << ["aaa", "bbb", "123", "c@d.com","1 Alpha Street", "admin"]
end

FasterCSV.foreach("../UoMAirlinesUsersDB.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|
   puts row[0]
end
