require 'rubygems'
require 'faster_csv'

unless File.exists?("../UoMAirlinesUsersDB.csv")
  FasterCSV.open("../UoMAirlinesUsersDB.csv", "w") do |csv|
    csv << ["us_FirstName","us_SurName","us_Password","us_Email","us_Address","us_Type"]
  end
end

FasterCSV.open("../UoMAirlinesUsersDB.csv", "a") do |csv|
  csv << ["aaa", "bbb", "12345678", "a@b.com","1 Alpha Street", "admin"]
  csv << ["ccc", "ddd", "456789456", "c@d.com","2 Beta Street", "client"]
   csv << ["sumayh", "aljameel", "456789456", "s_aljameel@yahoo.com","2 Beta Street", "client"]
end



FasterCSV.foreach("../UoMAirlinesUsersDB.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|
   puts row[0]
end