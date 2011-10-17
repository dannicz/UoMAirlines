require 'rubygems'
require 'faster_csv'

def load_database(path_to_csv)
  @emails = []
  FasterCSV.foreach(path_to_csv, :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|
    @emails << row[3] #change here to get the wanted value#
  end
  @emails.each { |n| n.downcase! }
  puts @emails
end

def search_for_email
  print "Enter E-mail to search for: "
  email = gets.chomp.downcase
  puts

  if @emails.include?(email)
    puts "#{email} Found!"
  else
    puts "#{email} Not found..."
  end
  prompt
end

def prompt
  print "Search again? (y or n) "
  answer = gets.chomp.downcase

  case answer
  when /y/
    search_for_email
  when /n/
    puts "Goodbye."
    exit
  else
    prompt
  end
end

load_database("../UoMAirlinesUsersDB.csv")
search_for_email